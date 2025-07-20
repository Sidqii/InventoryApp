import 'package:get/get.dart';
import 'package:pusdatin_end/controller/common/CtrlRiwayat.dart';
import 'package:pusdatin_end/services/operator/ServicesPersetujuan.dart';

class CtrlPersetujuan extends GetxController {
  final isloading = false.obs;
  final expandedId = ''.obs;
  final ctrl = Get.find<CtrlRiwayat>();
  final services = ServicesPersetujuan();

  Future<void> approval(
    int pengajuan,
    int status,
    int user,
    String? note,
  ) async {
    try {
      isloading.value = true;

      final approve = await services.approve(
        pengajuan,
        status,
        user,
        note,
      );

      if (approve == 200) {

        ctrl.refresh();

        Get.snackbar(
          'Sukses',
          'Berhasil ubah persetujuan',
        );
      } else {
        Get.snackbar(
          'Gagal',
          'Gagal ubah persetujuan',
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
