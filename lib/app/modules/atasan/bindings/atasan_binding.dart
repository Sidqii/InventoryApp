import 'package:get/get.dart';

import '../controllers/atasan_controller.dart';

class AtasanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AtasanController>(
      () => AtasanController(),
    );
  }
}
