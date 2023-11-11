class CustomersModel {
  String? status;
  String? callBack;
  List customers = [];
  Customer? customer;

  CustomersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];

    // data = json['data'] != null ? CustomerModel.fromJson(json['data']) : null;

    customers = json['data'] != null
        ? (json['data'] as List)
            .map((customer) => Customer.fromJson(customer))
            .toList()
        : [];
  }
  // List customer = [];
  CustomersModel.fromJson2(Map<String, dynamic> json) {
    status = json['status'];
    customer = json['data'] != null ? Customer.fromJson(json['data']) : null;
  }
}

// {
//    "add_customer_submit": "1",
//       "first_name": "firstNamesss",
//       "family_name": "firstNamesss",
//       "email": "asdadasdas@sss.com",
//       "phone_no": "phoneNumssbers",
//             "cellphone_no": "phoneNumssbers"

// }

class Customer {
  String? customerId;
  String? orgId;
  String? customerName;
  String? firstName;
  String? familyName;
  String? lastName;
  String? phoneNo;
  String? email;
  String? addSubmit;
  String? vatNumber;
  String? address;
  String? customerKey;
  Customer.fromJson(Map<String, dynamic> json) {
    customerId = json['id'].toString();
    orgId = json['org_id'].toString();
    customerName = json['full_name'];
    firstName = json['first_name'];
    familyName = json['family_name'];
    lastName = json['last_name'];
    phoneNo = json['phone_no'];
    email = json['email'];
    customerKey =
        '${json['phone_no']} ${json['family_name']} ${json['first_name']} ${json['full_name']} ${json['email']}';
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = customerId;
  //   data['org_id'] = orgId;
  //   data['first_name'] = firstName;
  //   data['last_name'] = lastName;
  //   data['add_customer_submit'] = addSubmit;
  //   return data;
  // }
}
