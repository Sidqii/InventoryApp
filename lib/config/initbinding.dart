import 'package:get/get.dart';
import 'package:pusdatin_end/controller/common/CtrlInventaris.dart';
import 'package:pusdatin_end/controller/common/CtrlSignIn.dart';
import 'package:pusdatin_end/controller/common/CtrlSignUp.dart';
import 'package:pusdatin_end/controller/common/CtrlUser.dart';
import 'package:pusdatin_end/controller/common/CtrlNavigasi.dart';
import 'package:pusdatin_end/controller/operator/CtrlPersetujuan.dart';
import 'package:pusdatin_end/controller/staff/CtrlPengajuan.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CtrlUser());
    Get.lazyPut(() => CtrlSignin());
    Get.lazyPut(() => CtrlNavigasi());
    Get.lazyPut(() => CtrlSignup());
    Get.lazyPut(() => CtrlPengajuan());
    Get.lazyPut(() => CtrlInventaris());
    Get.lazyPut(() => CtrlPersetujuan());
  }
}
