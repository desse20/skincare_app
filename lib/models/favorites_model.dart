import 'package:flutter/foundation.dart';

class FavoritesModel extends ChangeNotifier {
  final Set<String> _favoriteIds = {'1'};

  Set<String> get favoriteIds => Set.unmodifiable(_favoriteIds);

  bool isFavorite(String id) => _favoriteIds.contains(id);

  void toggleFavorite(String id) {
    if (_favoriteIds.contains(id)) {
      _favoriteIds.remove(id);
    } else {
      _favoriteIds.add(id);
    }
    notifyListeners();
  }
}
