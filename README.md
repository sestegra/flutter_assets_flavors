# flutter_assets_flavors

This application supports different set of assets and launcher icons depending on platform and flavor parameters.

| | X | Y | Z |
| :--- | --- | --- | --- |
| Android ![Android](https://raw.github.com/sestegra/flutter_assets_flavors/master/screenshots/android.jpg) | ![Android X](https://raw.github.com/sestegra/flutter_assets_flavors/master/screenshots/android-x.jpg) | ![Android Y](https://raw.github.com/sestegra/flutter_assets_flavors/master/screenshots/android-y.jpg) | ![Android Z](https://raw.github.com/sestegra/flutter_assets_flavors/master/screenshots/android-z.jpg) |
| iOS ![iOS](https://raw.github.com/sestegra/flutter_assets_flavors/master/screenshots/ios.jpg) | ![iOS X](https://raw.github.com/sestegra/flutter_assets_flavors/master/screenshots/ios-x.jpg) | ![iOS Y](https://raw.github.com/sestegra/flutter_assets_flavors/master/screenshots/ios-y.jpg) | ![iOS Z](https://raw.github.com/sestegra/flutter_assets_flavors/master/screenshots/ios-z.jpg) |

## Assets manifest files
Manifest files are loaded in following order

- `pubspec.yaml`
- `assets.yaml`
- `assets-<platform>.yaml`
- `assets-<flavor>.yaml` (only for local package)
- `assets-<platform>-<flavor>.yaml` (only for local package)

`assets`, `fonts` and `use-material-design` parameters are overridden at each loaded file.

When an assets file is not present, the next one is loaded without overriding parameters from previous steps.

Assets file format is the same as pubspec.yaml.

## Launcher icons manifest files

Note that following pull request is required [Read flavor icons files](https://github.com/fluttercommunity/flutter_launcher_icons/pull/69).

Manifest files are `flutter_launcher-<flavor>.yaml` (see [Flutter Launcher Icons](https://github.com/fluttercommunity/flutter_launcher_icons))

Launch following command to prepare flavored launcher icons.
```
$ flutter packages pub run flutter_launcher_icons:main
```

## Getting Started

In order to enable different set of assets, Flutter should be patched until pull request (https://github.com/flutter/flutter/pull/25487/files) will be merged.

Launch following command (only support Flutter 1.0.0 for now).

```
$ flutter-patch $(pwd) 1.0.0
```

Optionaly, you could use `flutter-flavor` command tool to manage flavors in your Flutter app. See https://github.com/sestegra/flutter-flavor repository.

## Run/Build
This project contains a `Makefile` that runs and builds flavored launcher icons and all flavored applications.

For running applications, launch following commands:
```
$ plutil -replace CFBundleIdentifier -string <base bundle id>.<flavor> ios/Runner/Info.plist # Workaround for issue #21335
$ flutter run --flavor <flavor> --target lib/main_<flavor>.dart
```

For building application, launch following commands:
```
$ flutter build apk --flavor <flavor> --target lib/main_<flavor>.dart
$ flutter build ios --flavor <flavor> --target lib/main_<flavor>.dart
```


## Opened issues/pull requests
Flutter
- [Platform specific assets](https://github.com/flutter/flutter/issues/8230)
- [Unable to launch app on ios simulator](https://github.com/flutter/flutter/issues/21335)
- [Support different set of assets depending on --flavor xxx](https://github.com/flutter/flutter/issues/21682)
- [Support different set of assets depending on platform and flavor parameters](https://github.com/flutter/flutter/pull/25487)

Flutter Launcher Icons
- [Flavors?](https://github.com/fluttercommunity/flutter_launcher_icons/issues/54)
- [Read flavor icons files](https://github.com/fluttercommunity/flutter_launcher_icons/pull/69)
