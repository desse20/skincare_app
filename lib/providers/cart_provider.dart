import 'package:flutter/material.dart';
import '../services/storage_service.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  Map<String, int> _items = {};
  Map<String, int> get items => _items;

  CartProvider() {
    _loadFromStorage();
  }

  int get totalCount => _items.values.fold(0, (sum, qty) => sum + qty);

  Future<void> _loadFromStorage() async {
    _items = await StorageService.loadCart();
    notifyListeners();
  }

  double getTotalAmount(List<Product> allProducts) {
    double total = 0.0;
    _items.forEach((productId, quantity) {
      try {
  
      final product = allProducts.firstWhere(
        (p) => p.id.toString() == productId.toString()
      );
      
      String cleanPrice = product.price.replaceAll('€', '').trim();
      double priceValue = double.tryParse(cleanPrice) ?? 0.0;
      
        total += (priceValue * quantity);
      } catch (e) {
        debugPrint("Produit non trouvé : $productId");
      }
    });
    return total;
  }
  
void addToCart(String productId, {int quantity = 1}) {
  if (_items.containsKey(productId)) {
    
    _items[productId] = _items[productId]! + quantity;
  } else {
  
    _items[productId] = quantity;
  }
  
  StorageService.saveCart(_items);
  notifyListeners();
}
  


  void removeOne(String productId) {
    if (!_items.containsKey(productId)) return;
    if (_items[productId]! > 1) {
      _items[productId] = _items[productId]! - 1;
    } else {
      _items.remove(productId);
    }
    StorageService.saveCart(_items);
    notifyListeners();
  }

  
  void clearCart() {
    _items = {};
    StorageService.saveCart(_items);
    notifyListeners();
  }
}