import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorites_provider.dart';
import '../widgets/custom_app_bar.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // On écoute le FavoritesProvider pour mettre à jour la liste en temps réel
    final favoritesProvider = context.watch<FavoritesProvider>();
    final favoriteIds = favoritesProvider.favoriteIds;

    return Scaffold(
      appBar: const CustomAppBar(title: "Mes Favoris"),
      body: favoriteIds.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: favoriteIds.length,
              itemBuilder: (ctx, i) {
                final productId = favoriteIds[i];
                
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: const Icon(Icons.favorite, color: Colors.red),
                    title: Text("Produit $productId"),
                    subtitle: const Text("Ajouté à vos coups de cœur"),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.grey),
                      onPressed: () {
                        // On retire des favoris au clic sur la poubelle
                        favoritesProvider.toggleFavorite(productId);
                      },
                    ),
                    onTap: () {
                      // Optionnel : Naviguer vers le détail du produit
                      // Navigator.pushNamed(context, '/product-detail', arguments: productId);
                    },
                  ),
                );
              },
            ),
    );
  }

  // Widget affiché quand la liste est vide
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 80, color: Colors.grey[300]),
          const SizedBox(height: 16),
          const Text(
            "Aucun favori pour le moment",
            style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          const Text("Parcourez nos produits et cliquez sur le cœur !"),
        ],
      ),
    );
  }
}