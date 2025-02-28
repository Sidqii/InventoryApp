import 'package:get/get.dart';
import 'package:pusdatin_end/module/service/services_register.dart';

class CtrlRegister extends GetxController {
  final ServicesRegister _servicesRegister = ServicesRegister();

  Future<void> register(String email, String password) async {
    int statusCode = await _servicesRegister.register(email, password);

    if (statusCode == 201) {
      Get.snackbar('Sukses', 'Registrasi berhasil');
    } else if (statusCode == 409) {
      Get.snackbar('Gagal', 'Email sudah terdaftar');
    } else {
      Get.snackbar('Gagal', 'Terjadi kesalahan!');
    }
  }
}
