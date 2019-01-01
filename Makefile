.PHONY: all
	
all:

.PHONY: build-icons build-launcher-icons

build-icons:
	convert -font ArialBk -pointsize 64 -gravity north -annotate 0 "\nX" assets/launcher_icon.png assets/x/launcher_icon.png
	convert -font ArialBk -pointsize 64 -gravity north -annotate 0 "\nY" assets/launcher_icon.png assets/y/launcher_icon.png
	convert -font ArialBk -pointsize 64 -gravity north -annotate 0 "\nZ" assets/launcher_icon.png assets/z/launcher_icon.png
	convert -font ArialBk -pointsize 64 -gravity north -annotate 0 "\nX" assets/launcher_icon-android.png assets/x/launcher_icon-android.png
	convert -font ArialBk -pointsize 64 -gravity north -annotate 0 "\nY" assets/launcher_icon-android.png assets/y/launcher_icon-android.png
	convert -font ArialBk -pointsize 64 -gravity north -annotate 0 "\nZ" assets/launcher_icon-android.png assets/z/launcher_icon-android.png
	convert -font ArialBk -pointsize 64 -gravity north -annotate 0 "\nX" assets/launcher_icon-ios.png assets/x/launcher_icon-ios.png
	convert -font ArialBk -pointsize 64 -gravity north -annotate 0 "\nY" assets/launcher_icon-ios.png assets/y/launcher_icon-ios.png
	convert -font ArialBk -pointsize 64 -gravity north -annotate 0 "\nZ" assets/launcher_icon-ios.png assets/z/launcher_icon-ios.png

build-launcher-icons:
	flutter packages pub run flutter_launcher_icons:main

.PHONY: run-x run-y run-z

run-x: patch-x
	flutter run --flavor x --target lib/main_x.dart

run-y: patch-y
	flutter run --flavor y --target lib/main_y.dart

run-z: patch-z
	flutter run --flavor z --target lib/main_z.dart

.PHONY: android-release android-release-x android-release-y android-release-z
android-release: android-release-x android-release-y android-release-z

android-release-x:
	flutter build apk --flavor x --target lib/main_x.dart
	flutter install

android-release-y:
	flutter build apk --flavor y --target lib/main_y.dart
	flutter install

android-release-z:
	flutter build apk --flavor z --target lib/main_z.dart
	flutter install

.PHONY: ios-release ios-release-x ios-release-y ios-release-z
ios-release: ios-release-x ios-release-y ios-release-z

ios-release-x: patch-x
	flutter build ios --flavor x --target lib/main_x.dart
	flutter install

ios-release-y: patch-y
	flutter build ios --flavor y --target lib/main_y.dart
	flutter install

ios-release-z: patch-z
	flutter build ios --flavor z --target lib/main_z.dart
	flutter install

.PHONY: android-debug android-debug-x android-debug-y android-debug-z
android-debug: android-debug-x android-debug-y android-debug-z

android-debug-x:
	flutter build apk --flavor x --target lib/main_x.dart --debug
	flutter install

android-debug-y:
	flutter build apk --flavor y --target lib/main_y.dart --debug
	flutter install

android-debug-z:
	flutter build apk --flavor z --target lib/main_z.dart --debug
	flutter install

.PHONY: ios-debug ios-debug-x ios-debug-y ios-debug-z
ios-debug: ios-debug-x ios-debug-y ios-debug-z

ios-debug-x: patch-x
	flutter build ios --flavor x --target lib/main_x.dart --debug
	flutter install

ios-debug-y: patch-y
	flutter build ios --flavor y --target lib/main_y.dart --debug
	flutter install

ios-debug-z: patch-z
	flutter build ios --flavor z --target lib/main_z.dart --debug
	flutter install

.PHONY: patch-x path-y patch-z unpatch

patch-x:
	plutil -replace CFBundleIdentifier -string com.example.flutterAssetsFlavors.x ios/Runner/Info.plist

patch-y:
	plutil -replace CFBundleIdentifier -string com.example.flutterAssetsFlavors.y ios/Runner/Info.plist

patch-z:
	plutil -replace CFBundleIdentifier -string com.example.flutterAssetsFlavors.z ios/Runner/Info.plist

unpatch:
	plutil -replace CFBundleIdentifier -string '$$(PRODUCT_BUNDLE_IDENTIFIER)' ios/Runner/Info.plist
