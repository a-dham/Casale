class ValidateModel {
  String? status;
  bool? message;
  Data? data;
  List? callBacks;
  int? cusotmerId;

  ValidateModel.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['msg'];
    if (json['data'] is int) {
      cusotmerId = json['data'];
    } else {
      data = Data.fromJson(json['data']);
    }
  }
}

class Data {
  Validator? validator;
  Data.fromJson(Map<String, dynamic> json) {
    validator = Validator.fromJson(json['validerr']);
  }
}

class Validator {
  List? fields;
  List? messages;

  Validator.fromJson(Map<String, dynamic> json) {
    fields = List.castFrom(json['fields']);
    messages = List.castFrom(json['msg']);
  }
}
