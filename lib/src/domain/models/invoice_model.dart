class InvoiceModel {
  String? status;
  bool? message;
  int? data;
  CallBack? callBack;
  InvoiceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
    callBack =
        json['callbacks'] != null ? CallBack.fromjson(json['callbacks']) : null;
  }
}

class CallBack {
  Order? order;
  CallBack.fromjson(Map<String, dynamic> json) {
    order = json['order'] != null ? Order.fromjson(json['order']) : null;
  }
}

class Order {
  String? inoivceNumber;
  String? orderDateTime;
  String? branchVatRegistration;
  String? branchAddress;
  String? customerVatNumber;
  String? cutomerAddress;
  String? accTitle;

  Order.fromjson(Map<String, dynamic> json) {
    inoivceNumber = json['ono'];
    orderDateTime = json['addotime'];
    branchVatRegistration = json['from_vat_no'];
    branchAddress = json['from_address'];
    customerVatNumber = json['to_vat_no'];
    cutomerAddress = json['to_address'];
    accTitle = json['acc_title'];
  }
}
