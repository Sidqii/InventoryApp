import 'package:get/get.dart';
import 'package:pusdatin_end/config/initbinding.dart';
import 'package:pusdatin_end/controller/ctrl_login.dart';
import 'package:pusdatin_end/dataset/model/pengguna.dart';
import 'package:pusdatin_end/interface/auth/interface_login.dart';

class CtrlUser extends GetxController {
  var user = Rxn<usersModels>();

  void setUser(usersModels userData) {
    user.value = userData;
  }

  void logout() {
    user.value = null;
    final ctrl = Get.find<CtrlLogin>();
    ctrl.clearForm();
    Get.offAll(() => InterfaceLogin(), binding: InitBinding());
  }
}
