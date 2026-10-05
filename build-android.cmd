@echo off
REM Builds the Android APK for touchlabelprintlabelapp.
REM
REM Usage:
REM   build-android.cmd            -> debug APK
REM   build-android.cmd release    -> unsigned release APK
REM
REM Notes:
REM   - cordova-android 8.1.0 only builds with JDK 8, so JAVA_HOME is set to it
REM     for this script only.
REM   - "cordova build android" crashes on recent Node versions (it spawns a .bat
REM     without a shell), so we run "cordova prepare" and then call Gradle directly.
REM   - Build tools 30.0.3 are forced because the latest installed (34.x) are not
REM     compatible with the Android Gradle Plugin 3.3 used by this platform.

setlocal

set "JDK8=C:\Program Files\Java\jdk1.8.0_202"
set "BUILD_TOOLS=30.0.3"

set "BUILD_TYPE=Debug"
if /i "%~1"=="release" set "BUILD_TYPE=Release"

if not exist "%JDK8%\bin\java.exe" (
  echo JDK 8 not found at "%JDK8%". Edit JDK8 in this script. >&2
  exit /b 1
)
set "JAVA_HOME=%JDK8%"
set "PATH=%JAVA_HOME%\bin;%PATH%"

pushd "%~dp0"

if not exist node_modules (
  echo === Installing npm dependencies ===
  call npm install || goto :fail
)

echo === Building web app into www\dist ===
call npm run build || goto :fail

echo === Copying web assets into the Android platform ===
call cordova.cmd prepare android || goto :fail

echo === Building %BUILD_TYPE% APK with Gradle ===
pushd platforms\android
call gradlew.bat cdvBuild%BUILD_TYPE% -PcdvBuildToolsVersion=%BUILD_TOOLS%
set "GRADLE_RESULT=%ERRORLEVEL%"
popd
if not "%GRADLE_RESULT%"=="0" goto :fail

echo.
echo Build successful. APK folder:
if /i "%BUILD_TYPE%"=="Release" (
  echo   %~dp0platforms\android\app\build\outputs\apk\release\
  echo   The release APK is unsigned - sign it before distributing.
) else (
  echo   %~dp0platforms\android\app\build\outputs\apk\debug\app-debug.apk
  echo   Install on a device with: adb install -r "%~dp0platforms\android\app\build\outputs\apk\debug\app-debug.apk"
)
popd
exit /b 0

:fail
echo.
echo Build FAILED. >&2
popd
exit /b 1
