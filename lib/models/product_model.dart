class Product {
  final String productid;
  final double price;
  final String type;
  final String description;
  final String imageUrl;

  Product({
    required this.productid,
    required this.price,
    required this.type,
    required this.description,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productid: json['productid'],
      price: json['price'].toDouble(),
      type: json['type_product'].toString().trim(),
      description: json['description_product'],
      imageUrl: json['imageURL'],
    );
  }
}
