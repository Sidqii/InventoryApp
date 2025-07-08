import 'package:get/get.dart';
import 'package:pusdatin_end/config/InitBinding.dart';
import 'package:pusdatin_end/controller/common/CtrlSignIn.dart';
import 'package:pusdatin_end/model/app_pengguna.dart';
import 'package:pusdatin_end/interface/common/HomeSignIn.dart';

class CtrlUser extends GetxController {
  var user = Rxn<PenggunaModel>();

  void setUser(PenggunaModel userData) {
    user.value = userData;
  }

  void logout() {
    user.value = null;
    final ctrl = Get.find<CtrlSignin>();
    ctrl.clearForm();
    Get.offAll(() => HomeSignin(), binding: InitBinding());
  }
}
