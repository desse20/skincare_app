// Pour l'AppBar avec le logo et le panier.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

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
    int count = context.watch<CartProvider>().totalCount;
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
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () => Navigator.of(context).pop(),
              ),
              if (count > 0) // On n'affiche le badge que si le panier n'est pas vide
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '$count',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
      ],
    );

  }  

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}