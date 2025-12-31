import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../widgets/custom_bottom_nav.dart';

import '../models/favorites_model.dart';
import '../models/product.dart';

class HomeScreen extends StatelessWidget {
  final FavoritesModel favoritesModel;

  const HomeScreen({super.key, required this.favoritesModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: favoritesModel,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.grey[50], // Light background
          appBar: AppBar(
            title: const Text(
              'Best Skincare',
              style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: SkincareSearchDelegate(),
                  );
                },
              ),
            ),
            
            const SizedBox(height: 24),

            // STEP 4: Featured Products
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildProductCard(
                    context,
                    name: 'Re:dence',
                    price: '160 €',
                    imagePath: 'assets/images/product1.png',
                    routeArgs: '1',
                  ),
                  _buildProductCard(
                    context,
                    name: 'Greenling',
                    price: '150 €',
                    imagePath: 'assets/images/product2.jpg',
                    routeArgs: '2',
                    isFavorite: false,
                  ),
                ],
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.cart);
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // STEP 2: Hero Section
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(16),
                  height: 200,
                  decoration: BoxDecoration(
                    color: const Color(0xFFC1E14D), // Lime green from mockup
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      // Hero Image - Woman with product
                      Positioned(
                        right: 0,
                        bottom: 0,
                        top: 0,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          child: Image.asset(
                            'assets/images/hero_model.png',
                            fit: BoxFit.cover,
                            width: 150,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'New Collection for\nDelicate skin',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, AppRoutes.collections);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                              ),
                              child: const Text('Shop Now', style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // STEP 3: Collections Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Collections', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      TextButton(onPressed: () {}, child: const Text('See all', style: TextStyle(color: Colors.grey))),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    children: ['All', 'Women', 'Man', 'Kids', 'Parents'].map((category) {
                      final isSelected = category == 'All';
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ChoiceChip(
                          label: Text(category),
                          selected: isSelected,
                          onSelected: (_) {},
                          selectedColor: const Color(0xFFC1E14D),
                          backgroundColor: Colors.white,
                          labelStyle: TextStyle(color: isSelected ? Colors.black : Colors.grey),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          side: BorderSide.none,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                
                const SizedBox(height: 24),

                // STEP 4: Featured Products
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: Product.dummyProducts.map((product) {
                      return _buildProductCard(
                        context,
                        product: product,
                        isFavorite: favoritesModel.isFavorite(product.id),
                        onFavoriteToggle: () => favoritesModel.toggleFavorite(product.id),
                      );
                    }).toList(),
                  ),
                ),
                 const SizedBox(height: 24),
              ],
            ),
          ),
          bottomNavigationBar: const CustomBottomNav(currentIndex: 0),
        );
      }
    );
  }

  Widget _buildProductCard(BuildContext context, {
    required Product product,
    required bool isFavorite,
    required VoidCallback onFavoriteToggle,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.productDetail, arguments: product.id);
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
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                      child: Image.asset(
                        product.images.first,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[100],
                            child: const Icon(Icons.image, size: 50, color: Colors.grey),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                     right: 8,
                     bottom: 8,
                     child: GestureDetector(
                       onTap: onFavoriteToggle,
                       child: CircleAvatar(
                         radius: 14,
                          backgroundColor: isFavorite ? const Color(0xFFC1E14D) : Colors.white,
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            size: 16,
                            color: isFavorite ? Colors.white : Colors.grey,
                          ),
                       ),
                     ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(product.price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SkincareSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(icon: const Icon(Icons.clear), onPressed: () => query = '')
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () => close(context, null),
  );

  @override
  Widget buildResults(BuildContext context) => Center(child: Text("Résultats pour $query"));

  @override
  Widget buildSuggestions(BuildContext context) => Container(); // Suggestions vides pour l'instant
}
