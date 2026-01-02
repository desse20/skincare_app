import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class StorageService {
  static const String _cartKey = 'user_cart';
  static const String _favKey = 'user_favorites';

  // --- PANIER ---
  static Future<void> saveCart(Map<String, int> items) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_cartKey, json.encode(items));
  }

  static Future<Map<String, int>> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString(_cartKey);
    return data == null ? {} : Map<String, int>.from(json.decode(data));
  }

  // --- FAVORIS ---
  static Future<void> saveFavorites(List<String> ids) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_favKey, ids);
  }

  static Future<List<String>> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favKey) ?? [];
  }
}