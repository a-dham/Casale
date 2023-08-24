import 'dart:convert';

class ProductsModel {
  ProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
  });
  int id;
  String title;
  double price;
  String description;
  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
      id: json["id"],
      title: json["title"],
      price: json["price"],
      description: json["description"]);
  // Factory ProductModel.fromJson(Map<String,dynamic> json) =>ProductsModel(id: json["id"], title: json["title"], price: json["price"], description: json["description"]);
}

List<ProductsModel> productsModelFromJson(String str) =>
    List<ProductsModel>.from(
        json.decode(str).map((x) => ProductsModel.fromJson(x)));

// String productsModelToJson(List<ProductsModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
