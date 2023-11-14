class BranchModel {
  String? status;
  Data? data;

  BranchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? orgId;
  String? branchId;
  String? accountId;
  String? branchName;

  Data.fromJson(Map<String, dynamic> json) {
    orgId = json["org_id"];
    branchId = json["branch_id"];
    accountId = json["account_id"];
    branchName = json["branch_name"];
  }
}
