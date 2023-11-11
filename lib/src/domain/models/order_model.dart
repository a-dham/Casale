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
    orderId = json['_ai'].toString();
    // accountId = json['acc_id'];
    orderNumber = json['ono'];
    orderdate = json['addotime'];
    // status = json['_status'];
    // branchId = json['from_id'];
    // customerId = json['to_id'];
    customerTitle = json['to_title'];
    totalItems = json['total_items'];
    totalItemsPrice = json['total_items_price'];
    tax = json['total_items_taxval'];
    totalsWithtax = json['total_items_withtaxval'];
  }
}

//   {
    
//     "add_pos_order_submit":1,
//      "_status": "saved", 
//     "org_id": 1000002,
//      "vat": 15,
//       "amount": 100,
//       "payed": 115,
      
//       "addotime": "2023-11-09 05:16:46",
//       "from_vat_no": null,
//       "from_address": null,
//       "from_title": null,
      
//       "to_id": null,
//       "to_title": null,
//       "to_vat_no": null,
//       "to_address": null,
      
//       "paymethods": "",
//       "used_paymethods": null,

//     "order_items":[
//         {
//             "item_id":3,
//             "unit_id":822,
//             "quantity":10,
//             "price":10,
//             "discount":0,
//             "dis_type":0,
//             "total_taxes":44
//         }
//     ]
// }


// {
//   "status": "success",
//   "msg": false,
//   "data": 3414,
//   "callbacks": {
//     "order": {
//       "total_rows": 0,
//       "total_items": null,
//       "total_items_price": null,
//       "total_items_discount": null,
//       "total_items_taxval": null,
//       "total_items_withtaxval": null,
//       "_ai": 3876,
//       "org_id": 1000002,
//       "id": 3414,
//       "tax_dir": "afterdis",
//       "_type": "sinv",
//       "oi__type": null,
//       "_status": "saved",
//       "oi__status": null,
//       "aono": "7",
//       "ono": "7",
//       "taxable": "yes",
//       "vat": "15.00",
//       "amount": "100.000",
//       "payed": "115.00",
//       "odate": "2023-11-09",
//       "exdate": null,
//       "addotime": "2023-11-09 05:16:46",
//       "savedotime": "2023-11-09 19:27:29",
//       "branch_id": null,
//       "acc_id": 100,
//       "by_id": 100,
//       "shift_id": null,
//       "from_id": null,
//       "to_id": null,
//       "notes": null,
//       "paymethods": "",
//       "discount": null,
//       "oi__ai": null,
//       "oi_id": null,
//       "oi_order_id": null,
//       "oi_quantity": null,
//       "oi_price": null,
//       "oi_dis_type": null,
//       "oi_discount": null,
//       "item_id": null,
//       "oi_unit_id": null,
//       "oi_taxes": null,
//       "oi_total_taxes": null,
//       "oi_total_price": null,
//       "oi_discount_val": null,
//       "oi_total_taxval": null,
//       "oi_total_withtax": null,
//       "from_title": null,
//       "from_vat_no": null,
//       "from_address": null,
//       "to_title": null,
//       "to_vat_no": null,
//       "to_address": null,
//       "type_title": "فاتورة بيع",
//       "status_title": "تم الحفظ",
//       "from_info": null,
//       "to_info": null,
//       "by_title": null,
//       "acc_title": null,
//       "used_paymethods": null,
//       "order_items": [],
//       "tlv_infos": [
//         null,
//         null,
//         "2023-11-09 19:27:29",
//         null,
//         null
//       ],
//       "tlv_val": "AQEwAgEwAxMyMDIzLTExLTA5IDE5OjI3OjI5BAEwBQEw"
//     }
//   }
// }

  