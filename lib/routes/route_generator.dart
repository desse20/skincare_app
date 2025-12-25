import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/collections_screen.dart';
import '../screens/product_detail_screen.dart';
import '../screens/cart_screen.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.collections:
        return MaterialPageRoute(builder: (_) => const CollectionsScreen());
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
