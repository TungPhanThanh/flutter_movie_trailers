import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Storage._();

  static Storage _instance;

  static Storage get instance {
    return _instance;
  }

  static SharedPreferences _spf;

  Future _init() async {
    _spf = await SharedPreferences.getInstance();
  }

  static Future<Storage> getInstance() async {
    if (_instance == null) {
      _instance = Storage._();
      await _instance._init();
    }
    return _instance;
  }

  static bool _beforCheck() {
    if (_spf == null) {
      return true;
    }
    return false;
  }

  // 判断是否存在数据
  bool hasKey(String key) {
    final Set keys = getKeys();
    return keys.contains(key);
  }

  Set<String> getKeys() {
    if (_beforCheck()) return null;
    return _spf.getKeys();
  }

  dynamic get(String key) {
    if (_beforCheck()) return null;
    return _spf.get(key);
  }

  String getString(String key) {
    if (_beforCheck()) return null;
    return _spf.getString(key);
  }

  Future<bool> putString(String key, String value) {
    if (_beforCheck()) return null;
    return _spf.setString(key, value);
  }

  bool getBool(String key) {
    if (_beforCheck()) return null;
    return _spf.getBool(key);
  }

  Future<bool> putBool(String key, bool value) {
    if (_beforCheck()) return null;
    return _spf.setBool(key, value);
  }

  int getInt(String key) {
    if (_beforCheck()) return null;
    return _spf.getInt(key);
  }

  Future<bool> putInt(String key, int value) {
    if (_beforCheck()) return null;
    return _spf.setInt(key, value);
  }

  double getDouble(String key) {
    if (_beforCheck()) return null;
    return _spf.getDouble(key);
  }

  Future<bool> putDouble(String key, double value) {
    if (_beforCheck()) return null;
    return _spf.setDouble(key, value);
  }

  List<String> getStringList(String key) {
    return _spf.getStringList(key);
  }

  Future<bool> putStringList(String key, List<String> value) {
    if (_beforCheck()) return null;
    return _spf.setStringList(key, value);
  }

  dynamic getDynamic(String key) {
    if (_beforCheck()) return null;
    return _spf.get(key);
  }

  Future<bool> remove(String key) {
    if (_beforCheck()) return null;
    return _spf.remove(key);
  }

  Future<bool> clear() {
    if (_beforCheck()) return null;
    return _spf.clear();
  }
}
