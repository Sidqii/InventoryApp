import 'package:get/get.dart';
import 'package:pusdatin_end/module/service/services_user.dart';
import 'package:pusdatin_end/page/main/screen.dart';

class AuthCtrl extends GetxController {
  var isloading = false.obs;
  var islogin = false.obs;

  Future<void> login(String email, String password) async {
    try {
      isloading.value = true;
      final response = await ServicesUser().loginUser(email, password);

      if (response['status'] == 'success') {
        islogin.value = true;
        Get.snackbar(
          'Berhasil',
          'Berhasil login!',
          duration: Duration(seconds: 2),
        );
        Get.offAll(
          ScreenPage(),
          transition: Transition.fadeIn,
          duration: Duration(
            milliseconds: 800,
          ),
        );
      } else {
        Get.snackbar(
          'Gagal',
          'Email atau password salah!',
          duration: Duration(seconds: 2),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan saat login!',
        duration: Duration(seconds: 2),
      );
    } finally {
      isloading.value = false;
    }
  }
}
