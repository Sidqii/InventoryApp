import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:inven/app/data/services/services_get.dart';
import 'package:inven/app/data/services/services_post.dart';
import 'package:inven/app/global/controllers/global_user_controller.dart';
import 'package:inven/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final services = ServicesPost();
  final servsget = ServicesGet();
  final loginKey = GlobalKey<FormState>();

  final ctrlEmail = TextEditingController();
  final ctrlPass = TextEditingController();

  final fcsEmail = FocusNode();
  final fcsPass = FocusNode();

  final isPassHide = true.obs;

  var isLoading = false.obs;
  var isLogin = false.obs;

  void toglePass() {
    isPassHide.value = !isPassHide.value;
  }

  void clearForm() {
    ctrlEmail.clear();
    ctrlPass.clear();
  }

  @override
  onClose() {
    ctrlEmail.dispose();
    ctrlPass.dispose();
    fcsEmail.dispose();
    fcsPass.dispose();
    super.onClose();
  }

  Future<void> login() async {
    final user = Get.find<GlobalUserController>();

    if (isLoading.value) return;

    if (!(loginKey.currentState?.validate() ?? false)) {
      return;
    }

    try {
      isLoading.value = true;

      final data = await services.postUser(ctrlEmail.text, ctrlPass.text);

      if (data != null) {
        user.setUser(data);

        Get.snackbar(
          'Sukses',
          'Berhasil melakukan login',
          duration: Duration(seconds: 2),
        );

        await Future.delayed(Duration(seconds: 2));

        switch (data.peranId) {
          case 1:
            Get.offAllNamed(Routes.ADMIN);
            break;
          case 2:
            Get.offAllNamed(Routes.ATASAN);
            break;
          case 3:
            Get.offAllNamed(Routes.OPERATOR);
            break;
          case 4:
            Get.offAllNamed(Routes.TEKNISI);
            break;
          case 5:
            Get.offAllNamed(Routes.STAFF);
            break;
          default:
        }
      } else {
        Get.snackbar(
          'Error',
          'Email atau Password salah',
          duration: Duration(seconds: 2),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan',
        duration: Duration(seconds: 2),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
