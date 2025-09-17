import 'package:get/get.dart';

import '../controllers/operator_nav_controller.dart';
import '../controllers/operator_edit_controller.dart';
import '../controllers/operator_controller.dart';

class OperatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OperatorController>(() => OperatorController());
    Get.lazyPut<OperatorEditController>(() => OperatorEditController());
    Get.lazyPut<OperatorNavController>(() => OperatorNavController());
  }
}
