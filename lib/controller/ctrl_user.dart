import 'package:get/get.dart';
import 'package:pusdatin_end/dataset/model/user.dart';

class CtrlUser extends GetxController {
  var user = Rxn<usersModels>();

  void setUser(usersModels userData) {
    user.value = userData;
  }

  void logout() {
    user.value = null;
  }
}
