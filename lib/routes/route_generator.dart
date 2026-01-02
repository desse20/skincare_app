import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/collections_screen.dart';
import '../screens/product_detail_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/profile_screen.dart';
import 'app_routes.dart';
import '../models/favorites_model.dart';


class RouteGenerator {
  final FavoritesModel favoritesModel;

  RouteGenerator({required this.favoritesModel});

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
            builder: (_) => HomeScreen(favoritesModel: favoritesModel));
      case AppRoutes.collections:
        return MaterialPageRoute(
            builder: (_) => CollectionsScreen(favoritesModel: favoritesModel));
      case AppRoutes.productDetail:
        final args = settings.arguments;
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => ProductDetailScreen(productId: args),
          );
        }
        return _errorRoute();
      case AppRoutes.cart:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case AppRoutes.profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('Page non trouvée'),
        ),
      ),
    );
  }
}
