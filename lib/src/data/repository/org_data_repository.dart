import 'package:casale/src/data/services/org_data_services.dart';
import 'package:casale/src/domain/models/org_model.dart';

class OrgDataRepository {
  Future<OrgModel?> getOrgData() async {
    try {
      Map<String, dynamic> orgData = await OrgDataServices().getOrgData();
      return OrgModel.fromJson(orgData);
    } catch (error) {
      // ignore: avoid_print
      print('error from repo org data ==== ${error.toString()}');
      return null;
    }
  }
}
