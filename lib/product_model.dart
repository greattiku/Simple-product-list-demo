class Product {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] != null
          ? int.tryParse(json['id'].toString())
          : null,
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'] as String?,
      category: json['category'] as String?,
      image: json['image'] as String?,
    );
  }

}