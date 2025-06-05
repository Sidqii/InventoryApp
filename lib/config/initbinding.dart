import 'package:get/get.dart';
import 'package:pusdatin_end/controller/ctrl_inventaris.dart';
import 'package:pusdatin_end/controller/ctrl_login.dart';
import 'package:pusdatin_end/controller/ctrl_navigasi.dart';
import 'package:pusdatin_end/controller/ctrl_pengajuan.dart';
import 'package:pusdatin_end/controller/ctrl_persetujuan.dart';
import 'package:pusdatin_end/controller/ctrl_register.dart';
import 'package:pusdatin_end/controller/ctrl_user.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CtrlUser());
    Get.lazyPut(() => CtrlLogin());
    Get.lazyPut(() => CtrlNavigasi());
    Get.lazyPut(() => CtrlRegister());
    Get.lazyPut(() => CtrlPengajuan());
    Get.lazyPut(() => CtrlInventaris());
    Get.lazyPut(() => CtrlPersetujuan());
  }
}
