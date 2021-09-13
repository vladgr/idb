import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  Future<void> save(String key, dynamic value) async {
    final SharedPreferences spr = await SharedPreferences.getInstance();

    if (value is bool) {
      spr.setBool(key, value);
    } else if (value is String) {
      spr.setString(key, value);
    } else if (value is int) {
      spr.setInt(key, value);
    } else if (value is double) {
      spr.setDouble(key, value);
    } else if (value is List<String>) {
      spr.setStringList(key, value);
    }
  }

  Future<bool?> getBool(String key) async {
    final spr = await SharedPreferences.getInstance();
    return spr.getBool(key);
  }

  Future<String?> getString(String key) async {
    final spr = await SharedPreferences.getInstance();
    return spr.getString(key);
  }

  Future<int?> getInt(String key) async {
    final spr = await SharedPreferences.getInstance();
    return spr.getInt(key);
  }

  Future<double?> getDouble(String key) async {
    final spr = await SharedPreferences.getInstance();
    return spr.getDouble(key);
  }

  Future<List<String>?> getStringList(String key) async {
    final spr = await SharedPreferences.getInstance();
    return spr.getStringList(key);
  }

  Future<void> remove(String key) async {
    final spr = await SharedPreferences.getInstance();
    spr.remove(key);
  }

  Future<void> clear() async {
    final spr = await SharedPreferences.getInstance();
    spr.clear();
  }

  Future<Set<String>> getKeys() async {
    final spr = await SharedPreferences.getInstance();
    return spr.getKeys();
  }
}
