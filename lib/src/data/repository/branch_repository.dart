import 'package:casale/src/data/services/branch_services.dart';
import 'package:casale/src/domain/models/branch_model.dart';

class BranchRepository {
  Future<BranchModel?> getLinkedBranchData() async {
    try {
      Map<String, dynamic> branchServices =
          await BranchServices().getLinkedBranchData();

      return BranchModel.fromJson(branchServices);
    } catch (error) {
      // ignore: avoid_print
      print('error from branch repo $error');
      return null;
    }
  }
}
