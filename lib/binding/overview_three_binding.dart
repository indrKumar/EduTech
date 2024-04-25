import 'package:get/get.dart';

import '../controllers/kyc_one/overview_three_controller.dart';

/// A binding class for the OverviewThreeScreen.
///
/// This class ensures that the OverviewThreeController is created when the
/// OverviewThreeScreen is first loaded.
class OverviewThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OverviewThreeController());
  }
}
