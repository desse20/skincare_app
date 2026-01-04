class Product {
  final String id;
  final String name;
  final String price;
  final List<String> images;
  final String capacity;
  final String category;
  final String description;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.images,
    required this.capacity,
    required this.category,
    this.description = '',
  });

  static const List<Product> dummyProducts = [
    Product(
      id: '1',
      name: 'Re:dence',
      price: '160',
      images: ['assets/images/product1.png'],
      capacity: '50ml',

      category: 'Women',

      description: 'A powerful serum for skin rejuvenation.',
    ),
    
    Product(
      id: '2',
      name: 'Greenling',
      price: '150',
      images: ['assets/images/product2.jpg'],
      capacity: '30ml',
      category: 'Women',
      description: 'Ideally suited for sensitive skin types.',
    ),
    Product(
      id: '3',
      name: 'Men Face Wash',
      price: '45',
      images: ['assets/images/product_man.png'],
      capacity: '100ml',
      category: 'Man',
      description: 'Deep cleansing face wash for men.',
    ),
    Product(
      id: '4',
      name: 'Baby Lotion',
      price: '25',
      images: ['assets/images/product_kids.png'],
      capacity: '200ml',
      category: 'Kids',
      description: 'Gentle lotion for delicate baby skin.',
    ),
    Product(
      id: '5',
      name: 'Family Cream',
      price: '60',
      images: ['assets/images/product_parents.png'],
      capacity: '450ml',
      category: 'Parents',
      description: 'Moisturizing cream for the whole family.',
    ),
    Product(
      id: '6',
      name: 'Lumière Serum',
      price: '180',
      images: ['assets/images/product_women.png'],
      capacity: '30ml',
      category: 'Women',
      description: 'Radiance boosting serum.',
    ),

  ];
}
