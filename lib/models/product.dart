class Product {
  final String id;
  final String name;
  final String price;
  final String imagePath;
  final String description;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath,
    this.description = '',
  });

  static const List<Product> dummyProducts = [
    Product(
      id: '1',
      name: 'Re:dence',
      price: '160 €',
      images: ['assets/images/product1.png'],
      capacity: '50ml',
      description: 'A powerful serum for skin rejuvenation.',
    ),
    Product(
      id: '2',
      name: 'Greenling',
      price: '150 €',
      images: ['assets/images/product2.jpg'],
      capacity: '30ml',
      description: 'Ideally suited for sensitive skin types.',
    ),
  ];
}
