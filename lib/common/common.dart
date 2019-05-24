import 'package:flutter_app/common/component_index.dart';

class Constant {
  static const String keyLanguage = 'key_language';

  static const int status_success = 200;

  static const String server_address = wan_android;

//  static const String wan_android = "http://www.wanandroid.com/";
//  static const String wan_android = "http://192.168.70.85/case_nuts/";
  static const String wan_android = "http://120.27.23.38:80/api/";

  static const int type_sys_update = 1;
  static const String key_theme_color = 'key_theme_color';
  static const String key_guide = 'key_guide';
  static const String key_splash_model = 'key_splash_models';

  static const platform = const MethodChannel("tangzy.flutter.io/java");

  static double screenWidth=0;
}

class AppConfig {
  static const String appName = 'flutter_app';
  static const String version = '0.1.5';
  static const bool isDebug = true;
}
