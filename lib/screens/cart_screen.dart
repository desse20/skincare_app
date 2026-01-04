import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
// import '../data/product_data.dart';
import '../models/product.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/custom_app_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    const limeColor = Color(0xFFC1E14D);

    // On utilise Product.dummyProducts pour calculer le total
    double total = cart.getTotalAmount(Product.dummyProducts);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      appBar: const CustomAppBar(
        title: "Mon Panier",
        showBackButton: true, 
        showCart: false, 
      ),
      body: cart.items.isEmpty
          ? const Center(child: Text("Votre panier est vide"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (ctx, i) {
                      String id = cart.items.keys.elementAt(i);
                      int qty = cart.items.values.elementAt(i);

                      // Recherche dans skincareProducts
                      Product? info;
                      try {
                        info = Product.dummyProducts.firstWhere((p) => p.id == id);
                      } catch (e) {
                        info = null;
                      }

                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(12),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: info != null
                                ? Image.asset(
                                    info.images[0],
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  )
                                : const Icon(Icons.image, size: 50),
                          ),
                          title: Text(
                            info?.name ?? "Produit $id",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text("Quantité : $qty"),
                          trailing: Text(
                            "${((double.tryParse(info?.price ?? '0') ?? 0) * qty).toInt()} €",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                _buildTotalSection(context, cart, total, limeColor),
              ],
            ),

      bottomNavigationBar: const CustomBottomNav(currentIndex: 2),
    );
  }

  Widget _buildTotalSection(
    BuildContext context,
    CartProvider cart,
    double total,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total à payer",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                "${total.toInt()} €",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0,
              ),
              onPressed: total > 0
                  ? () {
                      cart.clearCart(); // Vider le panier
                      _showSuccess(context);
                    }
                  : null,
              child: const Text(
                "PROCÉDER AU PAIEMENT",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSuccess(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Succès"),
        content: const Text("Paiement validé !"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pushReplacementNamed(context, '/'),
            child: const Text("OK", style: TextStyle(color: Color(0xFFC1E14D))),
          ),
        ],
      ),
    );
  }
}
