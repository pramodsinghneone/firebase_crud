class ProductModel {
  String? docId;
  final String name;
  final dynamic price;

  ProductModel({required this.name, required this.price, this.docId});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      price: json['price'],
    );
  }
}
