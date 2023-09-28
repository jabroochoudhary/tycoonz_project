import 'package:shared_preferences/shared_preferences.dart';

class AppLocalDataSaver {
  static String userId = "CURRUNTUSERIDKEY";
  static String userName = "USERNAMEKEY";
  static String userEmail = "USEREMAILKEY";
  static String token = "TOKENKEY";

  static Future<void> setString(String value, String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<void> setBool(bool val, String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, val);
  }

  static Future<bool?> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }
}
