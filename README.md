# flutter_assets_flavors

Support different set of assets depending on platform and flavor parameters.

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

## Getting Started

In order to enable different set of assets, Flutter should be patched until pull request (https://github.com/flutter/flutter/pull/25487/files) will be merged.

Launch following command (only support Flutter 1.0.0 for now).

```
$ flutter-patch $(pwd) 1.0.0
```

Optionaly, you could use `flutter-flavor` tool to manage flavors in your Flutter app. See https://github.com/sestegra/flutter-flavor.

## Build
- `flutter build apk --flavor <flavor> --target lib/main_<flavor>.dart`
- `flutter build ios --flavor <flavor> --target lib/main_<flavor>.dart`

This project contains a `Makefile` that builds all flavors.
