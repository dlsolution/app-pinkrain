fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew install fastlane`

# Available Actions
## iOS
### ios code_signing
```
fastlane ios code_signing
```
create or update certificate and provisioning profile - All
### ios build_develop
```
fastlane ios build_develop
```
build develop
### ios build_staging
```
fastlane ios build_staging
```
build staging
### ios build_appstore
```
fastlane ios build_appstore
```
build appstore
### ios release_dev
```
fastlane ios release_dev
```
build Develop & deploy to firebase app distribution
### ios release_staging
```
fastlane ios release_staging
```
build STAGING & deploy to Firebase App Distribution
### ios release_appstore
```
fastlane ios release_appstore
```
build RELEASE for AppStore

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
