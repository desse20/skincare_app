import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  // Liste simulée de produits
  final List<Product> allProducts = [
    Product(
      id: '1',
      name: 'Re:dence',
      price: '160',
      images: ['assets/images/product1.png'],
      capacity: '250ml',
      category: 'Women',
      description: 'Sérum anti-âge Re:dence, raffermit et illumine la peau.',
    ),
    Product(
      id: '2',
      name: 'Greenling',
      price: '150',
      images: ['assets/images/product2.jpg'],
      capacity: '200ml',
      category: 'Women',
      description: 'Crème hydratante Greenling, fraîcheur et éclat naturel.',
    ),
  ];

  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    // Récupération du produit
    final product = allProducts.firstWhere(
      (p) => p.id == widget.productId,
      orElse: () => allProducts[0],
    );
    
    final similarProducts = allProducts.where((p) => p.id != product.id).toList();
    const limeColor = Color(0xFFC1E14D);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Image du produit
          SizedBox(
            height: 300,
            child: PageView.builder(
              itemCount: product.images.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  product.images[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          
          // Infos produit
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  product.capacity,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Text(
                  '${product.price} €',
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                
                // Sélecteur de quantité
                Row(
                  children: [
                    const Text('Quantité :', style: TextStyle(fontSize: 16)),
                    const SizedBox(width: 12),
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: quantity > 1 
                          ? () => setState(() => quantity--) 
                          : null,
                    ),
                    Text('$quantity', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline),
                      onPressed: () => setState(() => quantity++),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Bouton Ajouter au panier
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: limeColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                onPressed: () {
                  context.read<CartProvider>().addToCart(product.id, quantity: quantity);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$quantity x ${product.name} ajouté au panier !'),
                      backgroundColor: Colors.black87,
                    ),
                  );
                },
                child: const Text(
                  'AJOUTER AU PANIER',
                  style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          // Description (ExpansionTile)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ExpansionTile(
              title: const Text('Détails du produit', style: TextStyle(fontWeight: FontWeight.bold)),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(product.description),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Produits similaires
          if (similarProducts.isNotEmpty) ...[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Produits similaires',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: similarProducts.length,
                itemBuilder: (context, index) {
                  final simProduct = similarProducts[index];
                  return Container(
                    width: 160,
                    margin: const EdgeInsets.only(right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            simProduct.images[0],
                            height: 140,
                            width: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          simProduct.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text('${simProduct.price} €', style: const TextStyle(color: Colors.green)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}