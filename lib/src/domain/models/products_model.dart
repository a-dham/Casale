class ItemModel {
  String? status;
  String? message;
  Map<String, Data> data = {};

  ItemModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['msg'];
    if (json['data'] != null) {
      json['data'].forEach((key, value) {
        data[key] = Data.fromJson(value);
      });
    }
  }
}

// class ItemModel {
//   String? status;
//   String? massage;
//   // Data? data;
//   Map<String, Data> data = {};

//   ItemModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     massage = json['msg'];
//     data = Map.from(Data.fromJson(json['data']) as Map)wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
//         .map((key, value) => MapEntry(key, value));
//   }
// }

class Data {
  String? itemId;
  String? status;
  String? title;
  String? englishTitle;
  String? arabicTitle;
  String? price;
  String? image;
  String? itemCode;
  String? tax;
  Data({
    required this.itemId,
    required this.status,
    required this.title,
    required this.englishTitle,
    required this.arabicTitle,
    required this.price,
    required this.image,
    required this.itemCode,
    required this.tax,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        itemId: json['id'],
        status: json['status'],
        title: json['title'],
        englishTitle: json['en_title'],
        arabicTitle: json['ar_title'],
        price: json['price'],
        image: json['thumb_dir'],
        itemCode: json['item_code'],
        tax: json['tax']);
  }
}

// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

// Item itemFromJson(String str) => Item.fromJson(json.decode(str));

// String itemToJson(Item data) => json.encode(data.toJson());

// class Item {
//   String status;
//   String msg;
//   Map<String, Datum> data;
//   List<dynamic> callbacks;

//   Item({
//     required this.status,
//     required this.msg,
//     required this.data,
//     required this.callbacks,
//   });

//   factory Item.fromJson(Map<String, dynamic> json) => Item(
//         status: json["status"],
//         msg: json["msg"],
//         data: Map.from(json["data"])
//             .map((k, v) => MapEntry<String, Datum>(k, Datum.fromJson(v))),
//         callbacks: List<dynamic>.from(json["callbacks"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "msg": msg,
//         "data": Map.from(data)
//             .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
//         "callbacks": List<dynamic>.from(callbacks.map((x) => x)),
//       };
// }

// class Datum {
//   String id;
//   String orgId;
//   String title;
//   String arTitle;
//   String enTitle;
//   String itemCode;
//   String iicode;
//   String isParent;
//   dynamic price;
//   String ssIoId;
//   String attachedId;
//   String status;
//   String sectionTitle;
//   String thumbDir;
//   String fileDir;
//   Units units;

//   Datum({
//     required this.id,
//     required this.orgId,
//     required this.title,
//     required this.arTitle,
//     required this.enTitle,
//     required this.itemCode,
//     required this.iicode,
//     required this.isParent,
//     required this.price,
//     required this.ssIoId,
//     required this.attachedId,
//     required this.status,
//     required this.sectionTitle,
//     required this.thumbDir,
//     required this.fileDir,
//     required this.units,
//   });

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         orgId: json["org_id"],
//         title: json["title"],
//         arTitle: json["ar_title"],
//         enTitle: json["en_title"],
//         itemCode: json["item_code"],
//         iicode: json["iicode"],
//         isParent: json["is_parent"],
//         price: json["price"],
//         ssIoId: json["ss_io_id"],
//         attachedId: json["attached_id"],
//         status: json["status"],
//         sectionTitle: json["section_title"],
//         thumbDir: json["thumb_dir"],
//         fileDir: json["file_dir"],
//         units: Units.fromJson(json["units"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "org_id": orgId,
//         "title": title,
//         "ar_title": arTitle,
//         "en_title": enTitle,
//         "item_code": itemCode,
//         "iicode": iicode,
//         "is_parent": isParent,
//         "price": price,
//         "ss_io_id": ssIoId,
//         "attached_id": attachedId,
//         "status": status,
//         "section_title": sectionTitle,
//         "thumb_dir": thumbDir,
//         "file_dir": fileDir,
//         "units": units.toJson(),
//       };
// }

// class Units {
//   The1 the1;

//   Units({
//     required this.the1,
//   });

//   factory Units.fromJson(Map<String, dynamic> json) => Units(
//         the1: The1.fromJson(json["1"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "1": the1.toJson(),
//       };
// }

// class The1 {
//   String ai;
//   String orgId;
//   String id;
//   String itemId;
//   String measurunitsId;
//   String title;
//   String unitCode;
//   String unitQuantity;
//   String channelId;
//   String unitPrice;
//   String averagePrice;
//   dynamic status;

//   The1({
//     required this.ai,
//     required this.orgId,
//     required this.id,
//     required this.itemId,
//     required this.measurunitsId,
//     required this.title,
//     required this.unitCode,
//     required this.unitQuantity,
//     required this.channelId,
//     required this.unitPrice,
//     required this.averagePrice,
//     required this.status,
//   });

//   factory The1.fromJson(Map<String, dynamic> json) => The1(
//         ai: json["_ai"],
//         orgId: json["org_id"],
//         id: json["id"],
//         itemId: json["item_id"],
//         measurunitsId: json["measurunits_id"],
//         title: json["title"],
//         unitCode: json["unit_code"],
//         unitQuantity: json["unit_quantity"],
//         channelId: json["channel_id"],
//         unitPrice: json["unit_price"],
//         averagePrice: json["average_price"],
//         status: json["status"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_ai": ai,
//         "org_id": orgId,
//         "id": id,
//         "item_id": itemId,
//         "measurunits_id": measurunitsId,
//         "title": title,
//         "unit_code": unitCode,
//         "unit_quantity": unitQuantity,
//         "channel_id": channelId,
//         "unit_price": unitPrice,
//         "average_price": averagePrice,
//         "status": status,
//       };
// }
