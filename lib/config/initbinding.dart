import 'package:get/get.dart';
import 'package:pusdatin_end/controller/ctrl_inventaris.dart';
import 'package:pusdatin_end/controller/ctrl_login.dart';
import 'package:pusdatin_end/controller/ctrl_panel.dart';
import 'package:pusdatin_end/controller/ctrl_pengajuan.dart';
import 'package:pusdatin_end/controller/ctrl_persetujuan.dart';
import 'package:pusdatin_end/controller/ctrl_register.dart';
import 'package:pusdatin_end/controller/ctrl_user.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CtrlUser());
    Get.lazyPut(() => CtrlLogin());
    Get.lazyPut(() => CtrlPanel());
    Get.lazyPut(() => CtrlRegister());
    Get.lazyPut(() => CtrlPengajuan());
    Get.lazyPut(() => CtrlInventaris());
    Get.lazyPut(() => CtrlPersetujuan());
  }
}
