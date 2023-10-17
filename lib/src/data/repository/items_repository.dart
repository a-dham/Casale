import 'package:casale/src/cubits/pos_cubit/local_items.dart';
import 'package:casale/src/data/services/items_services.dart';
import 'package:casale/src/domain/models/item_sections_model.dart';
import 'package:casale/src/domain/models/order_model.dart';
import 'package:casale/src/domain/models/products_model.dart';
import 'package:casale/src/presentation/views/pos/pos_home/widget/items.dart';

class ItemsRepository {
  Future<ItemModel?> getItems() async {
    try {
      Map<String, dynamic> itemsServices = await ItemsServices().getItems();
      // return ItemModel.fromJson(itemsServices);
      return ItemModel.fromJson(localItem);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
