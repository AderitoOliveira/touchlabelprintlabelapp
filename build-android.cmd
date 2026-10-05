@echo off
REM Builds the Android APK for touchlabelprintlabelapp.
REM
REM Usage:
REM   build-android.cmd            -> debug APK
REM   build-android.cmd release    -> signed release APK
REM
REM Release signing:
REM   The release APK is zipaligned and signed with the keystore in KEYSTORE
REM   (default: touchlabel-release.jks in this folder, alias "touchlabel").
REM   Create it once with:
REM     keytool -genkeypair -v -keystore touchlabel-release.jks -alias touchlabel -keyalg RSA -keysize 2048 -validity 10000
REM   Set KEYSTORE_PASS to the keystore password to sign without being prompted.
REM   KEYSTORE and KEY_ALIAS can also be overridden through environment variables.
REM   Keep the keystore and its password safe: every update must be signed with
REM   the same key, otherwise Android refuses to install it over the old app.
REM
REM Notes:
REM   - cordova-android 8.1.0 only builds with JDK 8, so JAVA_HOME is set to it
REM     for this script only.
REM   - "cordova build android" crashes on recent Node versions (it spawns a .bat
REM     without a shell), so we run "cordova prepare" and then call Gradle directly.
REM   - Build tools 30.0.3 are forced because the latest installed (34.x) are not
REM     compatible with the Android Gradle Plugin 3.3 used by this platform. Their
REM     apksigner also still runs on JDK 8.

setlocal

set "JDK8=C:\Program Files\Java\jdk1.8.0_202"
set "BUILD_TOOLS=30.0.3"

if not defined KEYSTORE set "KEYSTORE=%~dp0touchlabel-release.jks"
if not defined KEY_ALIAS set "KEY_ALIAS=touchlabel"

set "SDK=%ANDROID_SDK_ROOT%"
if not defined SDK set "SDK=%ANDROID_HOME%"
if not defined SDK set "SDK=%LOCALAPPDATA%\Android\Sdk"
set "BT_DIR=%SDK%\build-tools\%BUILD_TOOLS%"

set "BUILD_TYPE=Debug"
if /i "%~1"=="release" set "BUILD_TYPE=Release"

if not exist "%JDK8%\bin\java.exe" (
  echo JDK 8 not found at "%JDK8%". Edit JDK8 in this script. >&2
  exit /b 1
)
set "JAVA_HOME=%JDK8%"
set "PATH=%JAVA_HOME%\bin;%PATH%"

REM Check signing prerequisites before spending time on the build.
if /i not "%BUILD_TYPE%"=="Release" goto :checks_done
if not exist "%KEYSTORE%" (
  echo Keystore not found at "%KEYSTORE%". >&2
  echo Create it with: keytool -genkeypair -v -keystore "%KEYSTORE%" -alias %KEY_ALIAS% -keyalg RSA -keysize 2048 -validity 10000 >&2
  exit /b 1
)
if not exist "%BT_DIR%\apksigner.bat" (
  echo Build tools %BUILD_TOOLS% not found at "%BT_DIR%". >&2
  exit /b 1
)
:checks_done

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

if /i "%BUILD_TYPE%"=="Release" goto :sign

echo.
echo Build successful. APK:
echo   %~dp0platforms\android\app\build\outputs\apk\debug\app-debug.apk
echo   Install on a device with: adb install -r "%~dp0platforms\android\app\build\outputs\apk\debug\app-debug.apk"
popd
exit /b 0

:sign
set "OUT=%~dp0platforms\android\app\build\outputs\apk\release"
set "UNSIGNED=%OUT%\app-release-unsigned.apk"
set "ALIGNED=%OUT%\app-release-aligned.apk"
set "SIGNED=%OUT%\touchlabel-release.apk"

echo === Zipaligning release APK ===
if exist "%ALIGNED%" del "%ALIGNED%"
"%BT_DIR%\zipalign.exe" -p 4 "%UNSIGNED%" "%ALIGNED%" || goto :fail

echo === Signing release APK ===
REM minSdk is 19, so apksigner adds v1 (Android 4.4-6) and v2/v3 (Android 7+) signatures.
if exist "%SIGNED%" del "%SIGNED%"
if defined KEYSTORE_PASS (
  call "%BT_DIR%\apksigner.bat" sign --ks "%KEYSTORE%" --ks-key-alias "%KEY_ALIAS%" --ks-pass env:KEYSTORE_PASS --out "%SIGNED%" "%ALIGNED%" || goto :fail
) else (
  call "%BT_DIR%\apksigner.bat" sign --ks "%KEYSTORE%" --ks-key-alias "%KEY_ALIAS%" --out "%SIGNED%" "%ALIGNED%" || goto :fail
)
call "%BT_DIR%\apksigner.bat" verify "%SIGNED%" || goto :fail
del "%ALIGNED%"

echo.
echo Build successful. Signed APK:
echo   %SIGNED%
echo   Install on a device with: adb install -r "%SIGNED%"
popd
exit /b 0

:fail
echo.
echo Build FAILED. >&2
popd
exit /b 1
