class Product {
  final int id;
  final String name;
  final String brand;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      brand: json['brand'],
      image: json['image'],
    );
  }
}
