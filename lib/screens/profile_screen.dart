import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 180,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFC1E14D), Color(0xFFB0E0E6)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -40,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: const CircleAvatar(
                      radius: 56,
                      backgroundImage: AssetImage(
                        'assets/images/hero_model.png',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 56),
            const Text(
              'Nom de l’utilisateur',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'email@example.com',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _ProfileActionButton(
                    icon: Icons.edit,
                    label: 'Modifier',
                    onTap: () {},
                  ),
                  _ProfileActionButton(
                    icon: Icons.lock,
                    label: 'Mot de passe',
                    onTap: () {},
                  ),
                  _ProfileActionButton(
                    icon: Icons.logout,
                    label: 'Déconnexion',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.shopping_bag,
                        color: Colors.black87,
                      ),
                      title: const Text('Mes commandes'),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {},
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.favorite,
                        color: Colors.redAccent,
                      ),
                      title: const Text('Mes favoris'),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 3),
    );
  }
}

class _ProfileActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _ProfileActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Ink(
          decoration: const ShapeDecoration(
            color: Color(0xFFC1E14D),
            shape: CircleBorder(),
          ),
          child: IconButton(
            icon: Icon(icon, color: Colors.black87),
            onPressed: onTap,
            iconSize: 28,
          ),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 13)),
      ],
    );
  }
}
