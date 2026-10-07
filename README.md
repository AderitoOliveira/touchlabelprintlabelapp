# touchlabelprintlabelapp

> Touch Label Print Label App

## Build Setup

``` bash
# install dependencies
npm install

# serve with hot reload at localhost:8080
npm run dev

# build for production with minification
npm run build

# build for production and view the bundle analyzer report
npm run build --report
```

For a detailed explanation on how things work, check out the [guide](http://vuejs-templates.github.io/webpack/) and [docs for vue-loader](http://vuejs.github.io/vue-loader).

```
From a Windows Command Prompt:

  cd C:\touchlabelProjects\touchlabelprintlabelapp
  build-android.cmd            REM debug APK
  build-android.cmd release    REM signed release APK

  The script:
  1. Runs npm install, but only if node_modules is missing.
  2. Runs npm run build to rebuild the web app into www\dist.
  3. Runs cordova build android (cordova-android 14, target SDK 35 / Android 15).
  4. In release mode, zipaligns and signs the APK with touchlabel-release.jks
     (see the comments at the top of the script).

  Requirements: JDK 17 (Eclipse Adoptium Temurin) and Android SDK platform 35 + build tools 35.0.0.
  It switches to JDK 17 only while the script runs, so your default Java isn't affected. If any step fails, it stops and exits with an
  error. At the end it prints the APK path and the adb install command.

  - If you move JDK 17 or the build tools: the paths are at the top of the script (JDK17 and BUILD_TOOLS).
```


