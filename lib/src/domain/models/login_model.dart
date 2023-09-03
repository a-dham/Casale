class LoginModel {
  late String status;
  String? data;
  // UserData? data;

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
    // data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class UserData {
  String? sysAcc;
  UserData.fromJson(Map<String, dynamic> json) {
    sysAcc = json['sysac'];
  }
}
