class OrgModel {
  String? status;
  Data? data;

  OrgModel.fromJson(Map<String, dynamic> json) {
    status = json[status];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? orgId;
  String? orgTitle;
  String? englishTitle;
  String? arabicTitle;
  String? address;
  String? phone;
  String? vatNumber;
  String? logo;
  String? email;

  Data.fromJson(Map<String, dynamic> json) {
    orgId = json['id'];
    orgTitle = json['org_title'];
    englishTitle = json['en_n'];
    arabicTitle = json['ar_n'];
    address = json['address'];
    phone = json['cellphones'];
    vatNumber = json['vat_no'];
    logo = json['logo_path'];
    email = json['emails'];
  }
}
