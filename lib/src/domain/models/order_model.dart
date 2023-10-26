class OrderModel {
  String? status;
  List? data;
  OrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null
        ? List.from(json['data']).map((x) => Data.fromJson(x)).toList()
        : null;
  }
}

class Data {
  String? orderId;
  String? accountId;
  String? orderNumber;
  String? orderdate;
  String? status;
  String? totalItems;
  String? totalItemsPrice;
  String? tax;
  String? totalsWithtax;
  String? customerId;
  String? branchId;
  String? customerTitle;
  String? branchTitle;
  String? addOrdertime;
  String? savedOrdertime;
  String? orgId;
  String? paymethods;
  String? shiftId;
  String? notes;
  String? payed;

  Data.fromJson(Map<String, dynamic> json) {
    orderId = json['_ai'];
    accountId = json['acc_id'];
    orderNumber = json['ono'];
    orderdate = json['odate'];
    status = json['_status'];
    branchId = json['from_id'];
    customerId = json['to_id'];
    customerTitle = json['to_title'];
    totalItems = json['total_items'];
    totalItemsPrice = json['total_items_price'];
    tax = json['total_taxval'];
    totalsWithtax = json['totals_withtax'];
  }
}
