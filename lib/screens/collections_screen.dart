import 'package:flutter/material.dart';
import '../models/favorites_model.dart';
import '../models/product.dart';
import '../routes/app_routes.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_nav.dart';

class CollectionsScreen extends StatelessWidget {
  final FavoritesModel favoritesModel;

  const CollectionsScreen({super.key, required this.favoritesModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: favoritesModel,
      builder: (context, child) {
        final favoriteProducts = Product.dummyProducts
            .where((p) => favoritesModel.isFavorite(p.id))
            .toList();

        return Scaffold(
          backgroundColor: Colors.grey[50],
          // appBar: AppBar(
          //   title: const Text('My Favorites'),
          //   backgroundColor: Colors.white,
          //   foregroundColor: Colors.black,
          //   elevation: 0,
          //   leading: IconButton(
          //     icon: const Icon(Icons.arrow_back),
          //     onPressed: () => Navigator.pop(context),
          //   ),
          // ),
          appBar: const CustomAppBar(
            title: 'My Favorites',
            showBackButton: true, 
            showCart: true,
          ),

          body: favoriteProducts.isEmpty
              ? const Center(child: Text('You have no favorites yet.'))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                    itemCount: favoriteProducts.length,
                    itemBuilder: (context, index) {
                      final product = favoriteProducts[index];
                      return _buildProductCard(context, product);
                    },
                  ),
                ),
          bottomNavigationBar: const CustomBottomNav(currentIndex: 0),
        );
      },
    );
  }

  Widget _buildProductCard(BuildContext context, Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.productDetail,
          arguments: product.id,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: Image.asset(
                        product.images.first,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[100],
                            child: const Icon(
                              Icons.image,
                              size: 50,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    right: 8,
                    bottom: 8,
                    child: GestureDetector(
                      onTap: () => favoritesModel.toggleFavorite(product.id),
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: const Color(0xFFC1E14D),
                        child: const Icon(
                          Icons.favorite,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.price,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
