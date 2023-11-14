// ignore_for_file: avoid_print

import 'package:casale/src/config/routes/app_router.dart';
import 'package:casale/src/data/datasources/local/cashe_helper.dart';
import 'package:casale/src/data/datasources/remote/dio_helper.dart';
import 'package:casale/src/presentation/views/settings/widgets/settings_controller.dart';
import 'package:flutter/material.dart';
import 'src/casale.dart';
import 'src/presentation/views/settings/widgets/settings_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await DioHelper.init();
  await CacheHelper.init();
  // var box = await Hive.openBox('settings');
  // // box.put('darkMode', true);
  // print('Is Dark Mode: ${box.get('darkmode', defaultValue: false)}');

  String? initPage;
  var sysac = CacheHelper.getData(key: 'sysac');
  // CacheHelper.removeData(key: 'sysac');'
  bool? onboarding = await CacheHelper.getData(key: 'onboarding');
  String? locale = await CacheHelper.getData(key: 'localization');

  if (onboarding != null) {
    if (sysac != null) {
      print('sysac $sysac');
      initPage = Routes.bottomNavigation;
    } else {
      initPage = Routes.login;
    }
  } else {
    initPage = Routes.splash;
  }
  print(initPage);
  print(onboarding);
  print(sysac);
  print(locale);
  // initPage = Routes.bottomNavigation;

  // OrderRepository().getOrders();
  // final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  // final windowsInfo = await deviceInfo.windowsInfo;
  // String deviceId = windowsInfo.deviceId;
  // print('"---------------------"');
  // print(deviceId);

  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  runApp(Casale(
    settingsController: settingsController,
    initpage: initPage,
  ));
}

// رابط
// https://sys.orgsweb.com/?flr=casale/manage/settings/inputoptions/itemstypes&rtype=json&sysac=em5jem5hRE1oMnp6NzQwYno3NDJ6ejc0cm4xMXBhMzR3djIwcGE1MmZuNTJzYjIx
// https://sys.orgsweb.com/?flr=casale/manage/items/views&rtype=json&sysac=em5jY3hhZWNhNm16NzQyeno3NDVjejc0cWM0NHJuMzR6ejQxd3Y1M3p6NjJ0bTMxcm4xMWVtMTFxYzUyenozNHp6MjN3djgxc2I1M3JuOTU=
// https://sys.orgsweb.com/?flr=casale/manage/customers/views&rtype=json&sysac=em5jY3hhZWNhNm16NzQyeno3NDVjejc0cWM0NHJuMzR6ejQxd3Y1M3p6NjJ0bTMxcm4xMWVtMTFxYzUyenozNHp6MjN3djgxc2I1M3JuOTU=
// https://sys.orgsweb.com/?flr=casale/manage/sales/invoices/view&order_id=100&rtype=json&sysac=em5jY3hhZWNhNm16NzQyeno3NDVjejc0cWM0NHJuMzR6ejQxd3Y1M3p6NjJ0bTMxcm4xMWVtMTFxYzUyenozNHp6MjN3djgxc2I1M3JuOTU=
// https://sys.orgsweb.com/?flr=casale/manage/sales/invoices/views&rtype=json&sysac=em5jY3hhZWNhNm16NzQyeno3NDVjejc0cWM0NHJuMzR6ejQxd3Y1M3p6NjJ0bTMxcm4xMWVtMTFxYzUyenozNHp6MjN3djgxc2I1M3JuOTU=
// https://sys.orgsweb.com/?flr=casale/manage/settings/inputoptions/paymethods&rtype=json&sysac=em5jY3hhZWNhNm16NzQyeno3NDVjejc0cWM0NHJuMzR6ejQxd3Y1M3p6NjJ0bTMxcm4xMWVtMTFxYzUyenozNHp6MjN3djgxc2I1M3JuOTU=
// https://sys.orgsweb.com/?flr=casale/manage/sales/invoices/add&rtype=json&sysac=em5jY3hhZWNhNm16NzQyeno3NDVjejc0cWM0NHJuMzR6ejQxd3Y1M3p6NjJ0bTMxcm4xMWVtMTFxYzUyenozNHp6MjN3djgxc2I1M3JuOTU=
// https://sys.orgsweb.com/?flr=casale/manage/customers/add&rtype=json&sysac=em5jY3hhZWNhNm16NzQyeno3NDVjejc0cWM0NHJuMzR6ejQxd3Y1M3p6NjJ0bTMxcm4xMWVtMTFxYzUyenozNHp6MjN3djgxc2I1M3JuOTU=

// الأصناف 

// https://prnt.sc/x4w-u6AzQISI 

// الوحدات - الضرائب 

//  1- كيف هيتم التعامل معاهم 

// 2-  الأصناف هتكون راجعه فى ليست زي ما فى الصورة ولا هتيجي فى ماب ,زى الأول


// https://prnt.sc/jTgNSz0aeFAO



// الأعمدة دي بيها بيانات خاطئة  

// "oi_total_taxes": "15.00",  

//    "oi_total_price": "9.000",

//    "oi_discount_val": "0.000",

//    "oi_total_taxval": "1.350",

//    "oi_total_withtax": "10.350",

// ---------------------------

// دي إجماليات الفاتورة تمام الى فوق مش عارف ايه الهدف منها  .

// هتبقى للأصناف ولا  ؟ 

//    "total_items": "2",

//    "total_items_price": "13.000",

//    "total_items_discount": "0.000",

//    "total_items_taxval": "1.950",

//    "total_items_withtaxval": "14.950",


// بيانات الأصناف 

//  "item_id": 1079,

//    "oi_unit_id": 1079,

//    "oi_taxes": "1", 

// ---------------------------

// انا عامل صنفين جايب  صنف واحد كدا 

// وهيكون جوا { }



// طرق الدفع هتكون  واحده بس 

// ولا اختار اكثر من واحده وارسلهم ليست 

//    "paymethods": "657",



// https://prnt.sc/KpM8lUK2KjCF  صورة من إضافة فاتورة 




      // "order_items": [
      //   {
      //     "_ai": 3885,
      //     "org_id": 1000002,
      //     "id": 3418,
      //     "tax_dir": "afterdis",
      //     "_type": "sinv",
      //     "oi__type": "sinv",
      //     "_status": "saved",
      //     "oi__status": "saved",
      //     "aono": "182",
      //     "ono": "182",
      //     "taxable": "yes",
      //     "vat": "15.00",
      //     "amount": "100.000",
      //     "payed": "115.00",
      //     "odate": "2023-11-11",
      //     "exdate": null,
      //     "addotime": "2023-11-09 05:16:46",
      //     "savedotime": "2023-11-11 09:43:38",
      //     "branch_id": null,
      //     "acc_id": 100,
      //     "by_id": 100,
      //     "shift_id": null,
      //     "from_id": null,
      //     "to_id": null,
      //     "notes": null,
      //     "paymethods": "",
      //     "discount": null,
      //     "oi__ai": 10107,
      //     "oi_id": 8938,
      //     "oi_order_id": 3418,
      //     "oi_quantity": 2,
      //     "oi_price": "10.000",
      //     "oi_dis_type": null,
      //     "oi_discount": null,
      //     "item_id": 3,
      //     "oi_unit_id": 822,
      //     "oi_taxes": null,
      //     "oi_total_taxes": null,
      //     "oi_total_price": "20.000",
      //     "oi_discount_val": null,
      //     "oi_total_taxval": null,
      //     "oi_total_withtax": null,
      //     "order_saved": 1,
      //     "title": null,
      //     "item_ar_title": null,
      //     "item_en_title": null,
      //     "item_code": null,
      //     "iicode": null,
      //     "section_title": null
      //   },
      //   {
      //     "_ai": 3885,
      //     "org_id": 1000002,
      //     "id": 3418,
      //     "tax_dir": "afterdis",
      //     "_type": "sinv",
      //     "oi__type": "sinv",
      //     "_status": "saved",
      //     "oi__status": "saved",
      //     "aono": "182",
      //     "ono": "182",
      //     "taxable": "yes",
      //     "vat": "15.00",
      //     "amount": "100.000",
      //     "payed": "115.00",
      //     "odate": "2023-11-11",
      //     "exdate": null,
      //     "addotime": "2023-11-09 05:16:46",
      //     "savedotime": "2023-11-11 09:43:38",
      //     "branch_id": null,
      //     "acc_id": 100,
      //     "by_id": 100,
      //     "shift_id": null,
      //     "from_id": null,
      //     "to_id": null,
      //     "notes": null,
      //     "paymethods": "",
      //     "discount": null,
      //     "oi__ai": 10108,
      //     "oi_id": 8939,
      //     "oi_order_id": 3418,
      //     "oi_quantity": 2,
      //     "oi_price": "10.000",
      //     "oi_dis_type": null,
      //     "oi_discount": null,
      //     "item_id": 3,
      //     "oi_unit_id": 822,
      //     "oi_taxes": null,
      //     "oi_total_taxes": null,
      //     "oi_total_price": "20.000",
      //     "oi_discount_val": null,
      //     "oi_total_taxval": null,
      //     "oi_total_withtax": null,
      //     "order_saved": 1,
      //     "title": null,
      //     "item_ar_title": null,
      //     "item_en_title": null,
      //     "item_code": null,
      //     "iicode": null,
      //     "section_title": null
      //   }
      // ],