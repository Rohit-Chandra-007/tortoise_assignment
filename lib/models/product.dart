
class Product {
  final String id;
  final String name;
  final String shortName;
  final String imageUrl;
  final String createdAt;
  final String updatedAt;
  final String deviceType;
  final double mrp;
  final String manufacturerProductCode;
  final Map<String, dynamic> extras;

  Product({
    required this.id,
    required this.name,
    required this.shortName,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.deviceType,
    required this.mrp,
    required this.manufacturerProductCode,
    required this.extras,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      shortName: json['short_name'],
      imageUrl: json['image_url'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deviceType: json['device_type'],
      mrp: (json['mrp'] as num).toDouble(),
      manufacturerProductCode: json['manufacturer_product_code'],
      extras: json['extras'] ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'short_name': shortName,
      'image_url': imageUrl,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'device_type': deviceType,
      'mrp': mrp,
      'manufacturer_product_code': manufacturerProductCode,
      'extras': extras,
    };
  }
}
