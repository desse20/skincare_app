// // La carte produit que le Dev 3 utilisera sur la Home.


// import 'package:flutter/material.dart';

// class ProductCard extends StatelessWidget {
//   final String name;
//   final String brand;
//   final double price;
//   final String imageUrl;

//   const ProductCard({
//     super.key,
//     required this.name,
//     required this.brand,
//     required this.price,
//     required this.imageUrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: const Color(0xFFF5F5F5), // Fond gris très clair
//         borderRadius: BorderRadius.circular(25), // Coins très arrondis
//       ),
//       padding: const EdgeInsets.all(12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Image + Bouton Coeur
//           Expanded(
//             child: Stack(
//               children: [
//                 Center(child: Image.network(imageUrl, fit: BoxFit.contain)),
//                 const Positioned(
//                   bottom: 0, right: 0,
//                   child: CircleAvatar(
//                     backgroundColor: Colors.white,
//                     radius: 15,
//                     child: Icon(Icons.favorite, color: Color(0xFFC1FF21), size: 18),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 10),
//           Text(brand, style: const TextStyle(color: Colors.grey, fontSize: 12)),
//           Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//           const SizedBox(height: 5),
//           Text('\$${price.toInt()}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//         ],
//       ),
//     );
//   }
// }











import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String brand;
  final double price;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.name,
    required this.brand,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    imageUrl, 
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.image),
                  ),
                ),
                const Positioned(
                  bottom: 0, right: 0,
                  child: CircleAvatar(
                    backgroundColor: Color(0xFFF5F5F5),
                    radius: 15,
                    child: Icon(Icons.favorite, color: Color(0xFFC1FF21), size: 18),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(brand, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 5),
          Text('\$${price.toInt()}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ],
      ),
    );
  }
}