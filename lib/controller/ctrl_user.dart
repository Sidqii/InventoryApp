import 'package:get/get.dart';
import 'package:pusdatin_end/dataset/model/user.dart';
import 'package:pusdatin_end/interface/auth/interface_login.dart';

class CtrlUser extends GetxController {
  var user = Rxn<usersModels>();

  void setUser(usersModels userData) {
    user.value = userData;
  }

  void logout() {
    user.value = null;
    Get.offAll(() => InterfaceLogin());
  }
}
