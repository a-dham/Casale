class PaymethodModel {
  String? status;
  String? massage;
  List? data;
  PaymethodModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    massage = json["msg"];
    data = json["data"] != null
        ? List<Data>.from(json["data"].map((x) => Data.fromJson(x)))
        : null;
  }

  where(bool Function(dynamic method) param0) {}
}

class Data {
  String? paymethodId;
  String? englishTitle;
  String? arabicTitle;
  bool? inUse;

  Data.fromJson(Map<String, dynamic> json) {
    paymethodId = json['id'];
    englishTitle = json['en_title'];
    arabicTitle = json['ar_title'];
    inUse = json['inuse'];
  }
}
