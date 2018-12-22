import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:package_info/package_info.dart';

enum Flavor {
  x,
  y,
  z,
}

String getFlavorName(Flavor flavor) {
  String result;
  switch (flavor) {
    case Flavor.x:
      result = 'x';
      break;
    case Flavor.y:
      result = 'y';
      break;
    case Flavor.z:
      result = 'z';
      break;
  }
  return result;
}

class AppConfig extends InheritedWidget {
  final Flavor flavor;

  AppConfig({
    Key key,
    @required this.flavor,
    @required Widget child,
  }) : super(key: key, child: child);

  static AppConfig of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppConfig);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  String getTitle() => "Flavor Assets for ${getFlavorName(flavor)}";

  Future<String> loadStringAsset(String name) async {
    if (flavor != null) {
      return await rootBundle.loadString('assets/${getFlavorName(flavor)}/$name');
    } else {
      return await rootBundle.loadString('assets/$name');
    }
  }

  Future<String> getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    return [
      "appName: $appName",
      "packageName: $packageName",
      "version: $version",
      "buildNumber: $buildNumber",
    ].join("\n");
  }
}
