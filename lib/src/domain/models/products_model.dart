class ItemsModel {
  ItemsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.quantity,
  });
  int id;
  String title;
  double price;
  String description;
  int quantity;
  // factory ItemsModel.fromJson(Map<String, dynamic> json) => ItemsModel(
  //     id: json["id"],
  //     title: json["title"],
  //     price: json["price"],
  //     description: json["description"],
  //     quantity: json["quantity"]);
  // Factory ProductModel.fromJson(Map<String,dynamic> json) =>ItemsModel(id: json["id"], title: json["title"], price: json["price"], description: json["description"]);
}

// List<ItemsModel> ItemsModelFromJson(String str) =>
//     List<ItemsModel>.from(json.decode(str).map((x) => ItemsModel.fromJson(x)));

// String ItemsModelToJson(List<ItemsModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
