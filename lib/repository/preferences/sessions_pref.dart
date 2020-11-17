import 'package:flutter_movie/common/utils/Storage.dart';
import 'package:flutter_movie/common/utils/constants.dart';
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

  Future<String> getLanguage() async {
    String language = Storage.instance.getString(keyLanguage);
    if (language == null || language.isEmpty) {
      language = Constants.LANGUAGE_EN;
    }
    return language;
  }

}