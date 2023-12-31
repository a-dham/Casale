import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> saveData({
    required String key,
    required dynamic value,
  }) async {
    switch (value.runtimeType) {
      case String:
        return await sharedPreferences!.setString(key, value);
      case int:
        return await sharedPreferences!.setInt(key, value);
      case double:
        return await sharedPreferences!.setDouble(key, value);

      case bool:
        return await sharedPreferences!.setBool(key, value);

      case const (List<String>):
        return await sharedPreferences!.setStringList(key, value);

      case const (Map<String, dynamic>):
        return await sharedPreferences!.setStringList(key, value);

      case const (Future<dynamic>):
      default:
        return null;
    }

    // if (value is String) {
    //   return await sharedPreferences!.setString(key, value);
    // } else if (value is int) {
    //   return await sharedPreferences!.setInt(key, value);
    // } else if (value is double) {
    //   return await sharedPreferences!.setDouble(key, value);
    // } else if (value is bool) {
    //   return await sharedPreferences!.setBool(key, value);
    // } else if (value is List<String>) {
    //   return await sharedPreferences!.setStringList(key, value);
    // } else if (value is Map<String, dynamic>) {
    //   return await sharedPreferences!.setString(key, value.toString());
    // } else if (value is Future<dynamic>) {
    //   return await sharedPreferences!.setString(key, value.toString());
    // }
    // return null;
  }

  static dynamic getData({
    required String key,
  }) {
    return sharedPreferences!.get(key);
  }

  static Future<bool> removeData({
    required String key,
  }) async {
    return await sharedPreferences!.remove(key);
  }
}
