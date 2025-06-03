import 'package:get/get.dart';
import 'package:pusdatin_end/dataset/model/user.dart';
import 'package:pusdatin_end/controller/ctrl_user.dart';
import 'package:pusdatin_end/services/services_login.dart';
import 'package:pusdatin_end/page/navigator/navigator.dart';
import 'package:pusdatin_end/widget/customdialog.dart';

class CtrlLogin extends GetxController {
  var isloading = false.obs;
  var islogin = false.obs;

  Future<void> login(String email, String password) async {
    try {
      isloading.value = true;

      final response = await ServicesLogin().loginUser(email, password);
      final statusCode = response['status'];

      if (statusCode == 200) {
        final userId = response['user_id'];
        final userResponse = await ServicesLogin().getUserId(userId);
        
        if (userResponse['status'] == 'success') {
          final user = usersModels.fromJson(userResponse['data']);

          Get.put(CtrlUser()).setUser(user);

          islogin.value = true;
          CustomDialog.show(
            isSuccess: true,
            duration: Duration(milliseconds: 1080),
          );
          await Future.delayed(
            Duration(milliseconds: 1095),
          );
          Get.offAll(
            Navigator(),
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
