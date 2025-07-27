import 'package:get/get.dart';
import 'package:pusdatin_end/services/operator/ServicesSubmit.dart';

class CtrlSubmit extends GetxController {
  final isloading = false.obs;
  final services = ServicesSubmit();

  Future<void> updateunit(
    int perubahan,
    int sttsunit,
    int userid,
    int unitid,
    String? note,
  ) async {
    try {
      isloading.value = true;

      final revoke = await services.revoke(
        perubahan,
        sttsunit,
        userid,
        unitid,
        note ?? '',
      );

      if (revoke == 200) {
        Get.snackbar(
          'Sukses',
          'Berhasil update pengembalian',
        );
      } else {
        Get.snackbar(
          'Gagal',
          'Gagal update pengembalian',
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
