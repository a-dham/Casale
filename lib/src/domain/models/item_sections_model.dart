class ItemSectionsModel {
  String? status;
  List? data;
  ItemSectionsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json["data"] != null
        ? List<Data>.from(json["data"].map((x) => Data.fromJson(x)))
        : null;
  }
}

class Data {
  String? sectionId;
  String? englishTitle;
  String? arabicTitle;
  bool? inUse;
  Data.fromJson(Map<String, dynamic> json) {
    sectionId = json['id'];
    englishTitle = json['en_title'];
    arabicTitle = json['ar_title'];
    inUse = json['inuse'];
  }
}
