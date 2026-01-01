import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNav({super.key, required this.currentIndex});

  void _onItemTapped(BuildContext context, int index) {
    if (index == currentIndex) return;
    if (index == 0) Navigator.pushReplacementNamed(context, AppRoutes.home);
    if (index == 2) Navigator.pushReplacementNamed(context, AppRoutes.cart);
    if (index == 1) Navigator.pushReplacementNamed(context, AppRoutes.collections);
    if (index == 3) Navigator.pushReplacementNamed(context, AppRoutes.profile);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          // On utilise un noir très élégant avec 85% d'opacité
          color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.7), 
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(context, Icons.home_filled, 0),
            _buildNavItem(context, Icons.favorite_border, 1),
            _buildNavItem(context, Icons.shopping_cart, 2),
            _buildNavItem(context, Icons.person_outline, 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, int index) {
    final bool isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(context, index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFC1FF21) : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.black : Colors.black,
          size: 24,
        ),
      ),
    );
  }
}