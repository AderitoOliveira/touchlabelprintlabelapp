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
REM     "C:\Program Files\Eclipse Adoptium\jdk-17.0.20.101-hotspot\bin\keytool" -genkeypair -v -keystore touchlabel-release.jks -alias touchlabel -keyalg RSA -keysize 2048 -validity 10000
REM   Set KEYSTORE_PASS to the keystore password to sign without being prompted.
REM   KEYSTORE and KEY_ALIAS can also be overridden through environment variables.
REM   Keep the keystore and its password safe: every update must be signed with
REM   the same key, otherwise Android refuses to install it over the old app.
REM
REM Notes:
REM   - cordova-android 14 targets Android 15 (API 35) and requires JDK 17, so
REM     JAVA_HOME is set to it for this script only. Older target SDKs are blocked
REM     by Play Protect ("built for an older version of Android").
REM   - Requires Android SDK platform 35 and build tools 35.0.0.

setlocal

set "JDK17=C:\Program Files\Eclipse Adoptium\jdk-17.0.20.101-hotspot"
set "BUILD_TOOLS=35.0.0"
set "APK_NAME=touchLabelPrinLabel.apk"

if not defined KEYSTORE set "KEYSTORE=%~dp0touchlabel-release.jks"
if not defined KEY_ALIAS set "KEY_ALIAS=touchlabel"

set "SDK=%ANDROID_SDK_ROOT%"
if not defined SDK set "SDK=%ANDROID_HOME%"
if not defined SDK set "SDK=%LOCALAPPDATA%\Android\Sdk"
set "BT_DIR=%SDK%\build-tools\%BUILD_TOOLS%"

set "BUILD_TYPE=Debug"
if /i "%~1"=="release" set "BUILD_TYPE=Release"

if not exist "%JDK17%\bin\java.exe" (
  echo JDK 17 not found at "%JDK17%". Edit JDK17 in this script. >&2
  exit /b 1
)
set "JAVA_HOME=%JDK17%"
set "PATH=%JAVA_HOME%\bin;%PATH%"

REM Check signing prerequisites before spending time on the build.
if /i not "%BUILD_TYPE%"=="Release" goto :checks_done
if not exist "%KEYSTORE%" (
  echo Keystore not found at "%KEYSTORE%". >&2
  echo Create it with: "%JDK17%\bin\keytool" -genkeypair -v -keystore "%KEYSTORE%" -alias %KEY_ALIAS% -keyalg RSA -keysize 2048 -validity 10000 >&2
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

echo === Building %BUILD_TYPE% APK with Cordova ===
if /i "%BUILD_TYPE%"=="Release" goto :build_release
call cordova.cmd build android || goto :fail

set "DEBUG_APK=%~dp0platforms\android\app\build\outputs\apk\debug\%APK_NAME%"
copy /y "%~dp0platforms\android\app\build\outputs\apk\debug\app-debug.apk" "%DEBUG_APK%" >nul || goto :fail

echo.
echo Build successful. APK:
echo   %DEBUG_APK%
echo   Install on a device with: adb install -r "%DEBUG_APK%"
popd
exit /b 0

:build_release
REM Release builds default to an .aab bundle; force an unsigned APK and sign it below.
call cordova.cmd build android --release -- --packageType=apk || goto :fail

set "OUT=%~dp0platforms\android\app\build\outputs\apk\release"
set "UNSIGNED=%OUT%\app-release-unsigned.apk"
set "ALIGNED=%OUT%\app-release-aligned.apk"
set "SIGNED=%OUT%\%APK_NAME%"

echo === Zipaligning release APK ===
if exist "%ALIGNED%" del "%ALIGNED%"
"%BT_DIR%\zipalign.exe" -p 4 "%UNSIGNED%" "%ALIGNED%" || goto :fail

echo === Signing release APK ===
REM minSdk is 24, so apksigner adds v2/v3 signatures (Android 7+).
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
