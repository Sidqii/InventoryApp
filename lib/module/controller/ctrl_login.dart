import 'package:get/get.dart';
import 'package:pusdatin_end/module/service/services_login.dart';
import 'package:pusdatin_end/page/main/screen.dart';

class CtrlLogin extends GetxController {
  var isloading = false.obs;
  var islogin = false.obs;

  Future<void> login(String email, String password) async {
    try {
      isloading.value = true;
      final statusCode = await ServicesUser().loginUser(email, password);

      if (statusCode == 200) {
        islogin.value = true;
        Get.snackbar(
          'Berhasil',
          'Berhasil login',
          duration: Duration(seconds: 3),
        );
        await Future.delayed(Duration(seconds: 2));
        Get.offAll(
          ScreenPage(),
          transition: Transition.fadeIn,
          duration: Duration(milliseconds: 800),
        );
      } else if (statusCode == 401) {
        Get.snackbar(
          'Gagal',
          'Password salah',
          duration: Duration(seconds: 2),
        );
      } else if (statusCode == 404) {
        Get.snackbar(
          'Gagal',
          'Email belum terdaftar',
          duration: Duration(seconds: 2),
        );
      } else {
        Get.snackbar(
          'Error',
          'Terjadi kesalahan saat login',
          duration: Duration(seconds: 2),
        );
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan');
    } finally {
      isloading.value = false;
    }
  }
}
