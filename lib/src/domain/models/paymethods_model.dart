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
}

class Data {
  String? paymethodId;
  String? englishTitle;
  String? arabicTitle;
  double? value = 0.00;
  bool? inUse;

  Data.fromJson(Map<String, dynamic> json) {
    paymethodId = json['id'].toString();
    englishTitle = json['en_title'];
    arabicTitle = json['ar_title'];
    inUse = json['inuse'];
    value = 0.00;
  }

  // Map<String, dynamic> toJson() => {
  //       "paymethodId": paymethodId,
  //       "value": value,
  //     };

  // Map<String, dynamic> toJson(paymethodId, value) => {
  //       paymethodId: value,
  //     };
}

      // "org_id": 1000002,
      // "parent_id": null,
      // "io_name": "paymethods",
      // "en_title": "Cash",
      // "ar_title": "نقدى",
      // "def_io": null,
      // "id": 657,
      // "_ai": 425,
      // "title": "نقدى",
      // "inuse": true

