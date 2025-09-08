import 'package:get/get.dart';
import 'package:inven/app/global/controllers/global_inven_controller.dart';
import 'package:inven/app/global/controllers/global_user_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GlobalInvenController>(GlobalInvenController(), permanent: true);
    Get.put<GlobalUserController>(GlobalUserController(), permanent: true);
  }
}
