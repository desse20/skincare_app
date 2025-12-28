class Product {
  final String id;
  final String name;
  final String price;
  final List<String> images;
  final String capacity;
  final String description;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.images,
    required this.capacity,
    this.description = '',
  });
}
