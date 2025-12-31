// Pour l'AppBar avec le logo et le panier.
import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showCart;

  const CustomAppBar({
    super.key, 
    required this.title, 
    this.showCart = true, // Par défaut, on affiche le panier
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title, 
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        if (showCart)
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {

              Navigator.pushNamed(context, AppRoutes.cart);
            },
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}