class LoginModel {
  late bool status;
  late String message;
  UserData? data;

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class UserData {
  String? userName;
  String? password;
  UserData.fromJson(Map<String, dynamic> json) {
    userName = json['username'];
    password = json['password'];
  }
}
