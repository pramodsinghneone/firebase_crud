class ProductModel {
  final String name;
  final dynamic price;

  ProductModel({required this.name, required this.price});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      price: json['price'],
    );
  }
}
