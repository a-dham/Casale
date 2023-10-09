class ItemModel {
  String? status;
  String? message;
  List<Data> dataList = [];

  ItemModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['msg'];

    if (json['data'] != null) {
      json['data'].forEach((key, value) {
        Data data = Data.fromJson(value);
        dataList.add(data);
      });
    }
  }
}

class Data {
  String? itemId;
  String? status;
  String? englishTitle;
  String? arabicTitle;
  String? image;
  String? itemCode;
  int? quantity;
  double? tax;
  double? totalPriceWithVat;
  String? sectionId;
  String? sectionTitle;
  String? itemKey;
  // ss_io_id
  // section_title
  // Map<dynamic, Units> units = {};
  List<Units> units = [];
  List<UsedTaxes> taxes = [];
  int selectedUnit = 0;

  Data.fromJson(Map<String, dynamic> json) {
    itemId = json['id'];
    status = json['status'];
    englishTitle = json['en_title'];
    arabicTitle = json['ar_title'];
    image = json['thumb_dir'];
    itemCode = json['item_code'];
    sectionId = json['ss_io_id'];
    sectionTitle = json['section_title'];
    itemKey = '${json['en_title']} ${json['ar_title']} ${json['item_code']}';
    quantity = 1;
    totalPriceWithVat = 0;
    tax = 15;
    selectedUnit = 0;

    if (json['units'] != null) {
      json['units'].forEach((String key, dynamic value) {
        Units unit = Units.fromJson(value);
        units.add(unit);
      });
    }
    if (json['used_taxes'] != null) {
      json['used_taxes'].forEach((key, value) {
        UsedTaxes tax = UsedTaxes.fromJson(value);
        taxes.add(tax);
      });
    }
  }
}

class Units {
  String? unitId;
  String? itemId;
  String? title;
  String? unitQuantity;
  String? channelId;
  String? unitPrice;

  Units.fromJson(Map<String, dynamic> json) {
    unitId = json['_ai'];
    itemId = json['item_id'];
    title = json['measurunits_title'];
    unitQuantity = json['unit_quantity'];
    channelId = json['channel_id'];
    unitPrice = json['unit_price'];
  }
}

class UsedTaxes {
  String? value;
  String? title;
  UsedTaxes.fromJson(Map<String, dynamic> json) {
    value = json['val'];
    title = json['title'];
  }
}
