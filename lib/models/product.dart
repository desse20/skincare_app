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
}
