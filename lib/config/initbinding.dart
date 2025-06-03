import 'package:get/get.dart';
import 'package:pusdatin_end/controller/ctrl_inventaris.dart';
import 'package:pusdatin_end/controller/ctrl_panel.dart';
import 'package:pusdatin_end/controller/ctrl_persetujuan.dart';
import 'package:pusdatin_end/controller/ctrl_user.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CtrlUser());
    Get.put(CtrlPersetujuan());
    Get.lazyPut(() => CtrlItems());
    Get.lazyPut(() => CtrlPanel());
  }
}
