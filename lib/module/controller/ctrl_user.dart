import 'package:get/get.dart';
import 'package:pusdatin_end/dataset/model/user.dart';

class CtrlUser extends GetxController {
  var user = Rxn<usersModels>();

  void setUser(usersModels newUser) {
    user.value = newUser;
  }

  void logout() {
    user.value = null;
  }
}
