import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static Future<SharedPreferences> getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  static void clearSharedPreference() {
    getSharedPreferences().then((pref) {
      pref.clear();
    });
  }

  static putString(String value, String key) {
    getSharedPreferences().then((pref) {
      pref.setString(key, value);
    });
  }

  static putBoolean(bool value, String key) {
    getSharedPreferences().then((pref) {
      pref.setBool(key, value);
    });
  }

  static putJson(Map body, String key) async {
    await getSharedPreferences().then((pref) {
      pref.setString(key, json.encode(body));
    });
  }

  static Future<String> getString(String key) async {
    String text = await getSharedPreferences().then((pref) async {
      return await pref.get(key);
    });
    return (text == null ? "" : text);
  }

  static Future<bool> getBoolean(String key) async {
    bool val = await getSharedPreferences().then((pref) async {
      return await pref.get(key);
    });
    return val;
  }
}
