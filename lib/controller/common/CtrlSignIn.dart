import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/common/CtrlUser.dart';
import 'package:pusdatin_end/controller/common/CtrlNavigasi.dart';
import 'package:pusdatin_end/interface/common/NavPage.dart';
import 'package:pusdatin_end/services/common/ServicesSignIn.dart';
import 'package:pusdatin_end/widget/customdialog.dart';

class CtrlSignin extends GetxController {
  final services = ServicesSignin();
  final loginformkey = GlobalKey<FormState>();

  final emailctrl = TextEditingController();
  final passctrl = TextEditingController();

  final emailfocus = FocusNode();
  final passfocus = FocusNode();

  final isPassHidden = true.obs;

  var isloading = false.obs;
  var islogin = false.obs;

  void togglepass() {
    isPassHidden.value = !isPassHidden.value;
  }

  void clearForm() {
    emailctrl.clear();
    passctrl.clear();
  }

  @override
  void onClose() {
    emailctrl.dispose();
    passctrl.dispose();
    emailfocus.dispose();
    passfocus.dispose();
    super.onClose();
  }

  Future<void> login(String email, String password) async {
    try {
      isloading.value = true;

      final response = await services.loginUser(email, password);
      final statusCode = response['status'];

      if (statusCode == 200) {
        final userId = response['user_id'];
        final user = await services.getUser(userId);

        if (user != null) {
          final ctrlNav = Get.find<CtrlNavigasi>();

          Get.find<CtrlUser>().setUser(user);
          ctrlNav.setRole(user.role.toString());

          islogin.value = true;

          CustomDialog.show(
            isSuccess: true,
            duration: Duration(milliseconds: 1080),
          );

          await Future.delayed(
            Duration(milliseconds: 1095),
          );

          Get.offAll(
            const NavPage(),
            transition: Transition.fadeIn,
            duration: Duration(milliseconds: 800),
          );
        }
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
          'Tidak ada koneksi internet',
          duration: Duration(seconds: 2),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan',
      );
    } finally {
      isloading.value = false;
    }
  }
}
