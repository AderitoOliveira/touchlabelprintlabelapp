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
  build-android.cmd release    REM unsigned release APK

  The script runs the same steps as before:
  1. Runs npm install, but only if node_modules is missing.
  2. Runs npm run build to rebuild the web app into www\dist.
  3. Runs cordova prepare android.
  4. Calls gradlew.bat cdvBuildDebug (or cdvBuildRelease) with build tools 30.0.3.

  It switches to Java 8 only while the script runs, so your default Java 21 isn't affected. If any step fails, it stops and exits with an
  error. At the end it prints the APK path and the adb install command.

  - Release mode: I haven't run the release option yet. It should produce an unsigned APK in apk\release\, which you'll need to sign     
    before distributing.
  - If you move Java 8 or the build tools: the paths are at the top of the script (JDK8 and BUILD_TOOLS).
```
