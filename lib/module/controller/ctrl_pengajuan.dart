import 'package:get/get.dart';
import 'package:pusdatin_end/module/services/services_pengajuan.dart';

class CtrlPengajuan extends GetxController {
  final ServicesPengajuan _servicesPengajuan = ServicesPengajuan();
  var isLoading = false.obs;

  Future<bool> kirimPengajuan(
    int idPengguna,
    int idBarang,
    int jumlah,
    String tglKembali,
    String instansi,
    String hal,
  ) async {
    try {
      isLoading.value = true;
      int statusCode = await _servicesPengajuan.postPengajuan(
        idPengguna,
        idBarang,
        jumlah,
        tglKembali,
        instansi,
        hal,
      );

      if (statusCode == 200) {
        Get.snackbar('Sukses', 'Pengajuan berhasil');
        await Future.delayed(Duration(seconds: 2));
        return true;
      } else if (statusCode == 400) {
        Get.snackbar('Gagal', 'Gagal melakukan pengajuan');
        return false;
      } else {
        Get.snackbar('Gagal', 'Terjadi kesalahan');
        return false;
      }
    } catch (e) {
      Get.snackbar('Error', 'Tidak terkoneksi ke server');
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
