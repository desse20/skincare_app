import 'package:flutter/material.dart';
import '../services/storage_service.dart';

class FavoritesProvider with ChangeNotifier {
  List<String> _favoriteIds = [];
  List<String> get favoriteIds => _favoriteIds;

  FavoritesProvider() { _loadFromStorage(); }

  Future<void> _loadFromStorage() async {
    _favoriteIds = await StorageService.loadFavorites();
    notifyListeners();
  }

  bool isFavorite(String productId) => _favoriteIds.contains(productId);

  void toggleFavorite(String productId) {
    if (_favoriteIds.contains(productId)) {
      _favoriteIds.remove(productId);
    } else {
      _favoriteIds.add(productId);
    }
    StorageService.saveFavorites(_favoriteIds);
    notifyListeners();
  }
}