import 'package:flutter_assets_flavors/app_config.dart';
import 'package:flutter_assets_flavors/main.dart';
import 'package:flutter/widgets.dart';

void main() {
  var configuredApp = new AppConfig(
    flavor: null,
    child: new MyApp(),
  );
  
  runApp(configuredApp);
}
