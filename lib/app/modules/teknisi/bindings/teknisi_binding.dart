import 'package:get/get.dart';

import '../controllers/teknisi_controller.dart';

class TeknisiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeknisiController>(
      () => TeknisiController(),
    );
  }
}
