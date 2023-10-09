import 'package:casale/src/data/services/item_section_services.dart';
import 'package:casale/src/domain/models/item_sections_model.dart';

class ItemSectionsRepository {
  Future getItemSections() async {
    final itemsSections = await ItemSectionsServices().getItemsSections();
    return ItemSectionsModel.fromJson(itemsSections);
  }
}
