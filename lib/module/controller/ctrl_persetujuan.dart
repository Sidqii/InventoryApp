import 'package:get/get.dart';
import 'package:pusdatin_end/module/services/services_pengajuan.dart';
import 'package:pusdatin_end/module/services/services_persetujuan.dart';

class CtrlPersetujuan extends GetxController {
  final ServicesPersetujuan _servicespersetujuan = ServicesPersetujuan();
  final ServicesPengajuan _servicespengajuan = ServicesPengajuan();
  final dataPengajuan = <dynamic>[].obs;
  final isLoading = false.obs;
  final expandedId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPengajuan();
  }

  Future<bool> editPengajuan(int idPengajuan, int idStatus) async {
    try {
      isLoading.value = true;
      int statusCode = await _servicespersetujuan.patchPersetujuan(
        idPengajuan,
        idStatus,
      );
      if (statusCode == 200) {
        Get.snackbar('Sukses', 'Berhasil disetujui');
        expandedId.value = '';
        await Future.delayed(Duration(seconds: 2));
        return true;
      } else if (statusCode == 400) {
        Get.snackbar('Gagal', 'Gagal merubah status');
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

  Future<void> fetchPengajuan() async {
    try {
      isLoading.value = true;
      var data = await _servicespengajuan.getAllPengajuan();

      if (data.isNotEmpty) {
        dataPengajuan.assignAll(data);
      }
    } catch (e) {
      Get.snackbar('Error', 'Gagal ambil data');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchPengajuanId(int? userId) async {
    if (userId == null) return;
    isLoading.value = true;
    try {
      final result = await _servicespengajuan.getIdPengajuan(userId);
      dataPengajuan.value = result;
    } catch (e) {
      dataPengajuan.clear();
    } finally {
      isLoading.value = false;
    }
  }
}
