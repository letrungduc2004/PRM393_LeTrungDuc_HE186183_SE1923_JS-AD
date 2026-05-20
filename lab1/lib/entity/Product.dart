class Product {
  final int id;
  final String name;
  final String image;
  final double price;

  const Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });


  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
    };
  }

  Product copyWith({
    int? id,
    String? name,
    String? image,
    double? price,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
    );
  }


  @override
  String toString() {
    return 'Product(id: $id, name: $name, image: $image, price: $price)';
  }
}
