class ItemSectionsModel {
  String? status;
  List? data;
  ItemSectionsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];

    // if (json.containsKey('data') && json['data'] is List) {
    //   data = (json['data'] as List<dynamic>)
    //       .map((item) => Data.fromJson(item))
    //       .toList();
    // } else {
    //   // Handle missing or unexpected 'data' key in the JSON
    //   data = []; // Set a default value or handle it according to your app logic
    // }

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
    sectionId = json['id'].toString();
    englishTitle = json['en_title'];
    arabicTitle = json['ar_title'];
    inUse = json['inuse'];
  }
}
