import 'package:get/get.dart';

import '../controllers/public_controller.dart';

class PublicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PublicController>(
      () => PublicController(),
    );
  }
}
