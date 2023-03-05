;;; Compiled snippets and support files for `android-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'android-mode
                     '(("__build.gradle" "buildscript {\n    repositories {\n        mavenCentral()\n    }\n    dependencies {\n        classpath 'com.android.tools.build:gradle:1.2.3'\n    }\n}\n\napply plugin: 'android'\n\nandroid {\n    compileSdkVersion 22\n    buildToolsVersion \"22.0.1\"\n\n    sourceSets {\n        main {\n            manifest.srcFile 'AndroidManifest.xml'\n            java.srcDirs = ['java']\n            resources.srcDirs = ['java']\n            aidl.srcDirs = ['java']\n            renderscript.srcDirs = ['java']\n            res.srcDirs = ['res']\n            assets.srcDirs = ['assets']\n        }\n\n        // Move the tests to tests/java, tests/res, etc...\n        androidTest.setRoot('../tests')\n\n        // Move the build types to build-types/<type>\n        // For instance, build-types/debug/java, build-types/debug/AndroidManifest.xml, ...\n        // This moves them out of them default location under src/<type>/... which would\n        // conflict with src/ being used by the main source set.\n        // Adding new build types or product flavors should be accompanied\n        // by a similar customization.\n        debug.setRoot('build-types/debug')\n        release.setRoot('build-types/release')\n    }\n\n    lintOptions {\n        abortOnError false\n    }\n}\n\n$0\n" "build.gradle template"
                        (eq major-mode 'groovy-mode)
                        nil nil "/home/camus/.doom.d/templates/android-mode/__build.gradle" nil nil)))


;;; Do not edit! File generated at Sun Mar  5 15:17:39 2023
