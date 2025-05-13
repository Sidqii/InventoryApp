import 'package:get/get.dart';
import 'package:pusdatin_end/module/services/services_register.dart';

class CtrlRegis extends GetxController {
  final ServicesRegister _servicesRegister = ServicesRegister();
  var isLoading = false.obs;

  Future<bool> register(String email, String password) async {
    isLoading.value = true;
    try {
      int statusCode = await _servicesRegister.register(email, password);

      if (statusCode == 201) {
        Get.snackbar('Sukses', 'Registrasi berhasil');
        await Future.delayed(Duration(seconds: 3));
        return true;
      } else if (statusCode == 409) {
        Get.snackbar('Gagal', 'Email sudah terdaftar');
        return false;
      } else {
        Get.snackbar('Gagal', 'Terjadi kesalahan!');
        return false;
      }
    } finally {
      isLoading.value = false;
    }
  }
}
