import 'package:get/get.dart';
import 'package:inven/app/data/models/AppUser.dart';
import 'package:inven/app/global/bindings/InitialBinding.dart';
import 'package:inven/app/modules/login/controllers/login_controller.dart';
import 'package:inven/app/modules/login/views/login_view.dart';

class GlobalUserController extends GetxController {
  final user = Rxn<AppUser>();

  void setUser(AppUser model) {
    user.value = model;
  }

  void logout() {
    user.value = null;

    final login = Get.find<LoginController>();
    login.clearForm();

    Get.offAll(() => LoginView(), binding: InitialBinding());
  }
}
