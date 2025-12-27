import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav.dart';
import '../routes/app_routes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panier'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
           onPressed: () => Navigator.pushNamed(context, AppRoutes.home),
        ),
      ),
      body: const Center(child: Text('Cart Screen - À implémenter')),

      bottomNavigationBar: const CustomBottomNav(currentIndex: 2),
    );
  }
}
