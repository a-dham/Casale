import 'package:casale/src/domain/models/products_model.dart';

import '../services/items_services.dart';

class ItemsRepository {
  Future<ItemModel?> getItems() async {
    try {
      // ignore: unused_local_variable
      Map<String, dynamic> itemsServices = await ItemsServices().getItems();
      return ItemModel.fromJson(itemsServices);
      // Map<String, dynamic> itemsLocal = localItem;
      // return ItemModel.fromJson(itemsLocal);
    } catch (error) {
      // ignore: avoid_print
      print('items error  ${error.toString()}');
      return null;
    }
  }
}
