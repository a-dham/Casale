class LoginModel {
  String? status;
  UserData? data;

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class UserData {
  String? userId;
  String? orgId;
  String? accountTitle;
  String? accountStatus;
  String? sysac;

  UserData.fromJson(Map<String, dynamic> json) {
    userId = json['id'].toString();
    orgId = json['org_id'].toString();
    sysac = json['sysac'];
    accountTitle = json['title'];
    accountStatus = json['status'];
  }
}
