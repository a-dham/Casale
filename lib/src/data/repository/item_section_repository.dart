import 'package:casale/src/data/services/item_section_services.dart';
import 'package:casale/src/domain/models/item_sections_model.dart';

class ItemSectionsRepository {
  Future getItemSections() async {
    try {
      final itemsSections = await ItemSectionsServices().getItemsSections();
      if (itemsSections is String) {
        return [];
      } else {
        return ItemSectionsModel.fromJson(itemsSections);
      }
    } catch (error) {
      // ignore: avoid_print
      print(error.toString());
      return {};
    }
  }
}
