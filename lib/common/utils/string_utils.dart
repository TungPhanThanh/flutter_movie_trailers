import 'package:package_info/package_info.dart';

class StringUtils{
  static String enumName(String enumToString){
    final List<String> paths = enumToString.split(',');
    return paths[paths.length - 1];
  }

  // Retrieve package info
  static Future<PackageInfo> packageInfo() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo;
  }

  static bool isEmail(String email){
    const String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final RegExp regExp = RegExp(p);
    return regExp.hasMatch(email.trim());
  }

  static bool validatePassword(String value){
    const String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,20}$';
    final RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static String enumToEnumName(String enumToString){
    final List<String> paths = enumToString.split('.');
    return paths[paths.length - 1];
  }

}