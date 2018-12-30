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

Optionaly, you could use `flutter-flavor` tool to manage flavors in your Flutter app. See https://github.com/sestegra/flutter-flavor repository.

## Build
- `flutter build apk --flavor <flavor> --target lib/main_<flavor>.dart`
- `flutter build ios --flavor <flavor> --target lib/main_<flavor>.dart`

This project contains a `Makefile` that builds flavored launcher icons and all flavored applications.
