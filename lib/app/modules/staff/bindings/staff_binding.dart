import 'package:get/get.dart';
import 'package:inven/app/modules/staff/controllers/staff_nav_controller.dart';

import '../controllers/staff_controller.dart';

class StaffBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StaffController>(
      () => StaffController(),
    );
    Get.lazyPut<StaffNavController>(
      () => StaffNavController(),
    );
  }
}
