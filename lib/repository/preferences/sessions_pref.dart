import 'package:flutter_movie/repository/preferences/pref_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionsPref {
  saveSession({String accessToken}) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(keyAccessToken, accessToken);
  }

  Future<String> getAccessToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(keyAccessToken);
  }
}