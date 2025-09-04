import 'package:get/get.dart';
import 'package:inven/app/data/models/AppUser.dart';

class GlobalUserController extends GetxController {
  final user = Rxn<AppUser>();

  void setUser(AppUser model) {
    user.value = model;
  }

  void logout() {
    //logout user
  }
}
