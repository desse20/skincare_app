// Un petit widget stylisé pour afficher les prix.


import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  final double price;
  const PriceTag({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${price.toInt()}', 
      style: const TextStyle(
        fontSize: 18, 
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}