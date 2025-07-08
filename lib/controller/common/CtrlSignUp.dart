import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/interface/common/HomeSignIn.dart';
import 'package:pusdatin_end/services/common/ServicesSignUp.dart';

class CtrlSignup extends GetxController {
  final services = ServicesSignup();
  final regisformkey = GlobalKey<FormState>();

  final emailctrl = TextEditingController();
  final passctrl = TextEditingController();
  final confirmctrl = TextEditingController();

  final emailfocus = FocusNode();
  final passfocus = FocusNode();
  final confirmfocus = FocusNode();

  final isPassHidden = true.obs;

  var isLoading = false.obs;

  void togglepass() {
    isPassHidden.value = !isPassHidden.value;
  }

  @override
  void onClose() {
    emailctrl.dispose();
    passctrl.dispose();
    confirmctrl.dispose();
    emailfocus.dispose();
    passfocus.dispose();
    confirmfocus.dispose();
    super.onClose();
  }

  Future<bool> register(String email, String password) async {
    isLoading.value = true;

    try {
      final response = await services.register(email, password);
      final statusCode = response['status'];

      if (statusCode == 201) {
        Get.snackbar('Sukses', 'Registrasi berhasil');

        await Future.delayed(Duration(seconds: 3));

        emailctrl.clear();
        passctrl.clear();
        confirmctrl.clear();

        Get.to(
          HomeSignin(),
          transition: Transition.fadeIn,
          duration: Duration(milliseconds: 500),
        );

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
