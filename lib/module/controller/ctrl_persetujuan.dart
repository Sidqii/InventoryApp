import 'package:get/get.dart';
import 'package:pusdatin_end/dataset/model/pengajuan.dart';
import 'package:pusdatin_end/module/services/services_pengajuan.dart';
import 'package:pusdatin_end/module/services/services_persetujuan.dart';

class CtrlPersetujuan extends GetxController {
  final ServicesPersetujuan _servicespersetujuan = ServicesPersetujuan();
  final ServicesPengajuan _servicespengajuan = ServicesPengajuan();
  final dataPengajuan = <PengajuanModels>[].obs;
  final isLoading = false.obs;
  final expandedId = ''.obs;

  List<PengajuanModels> parseList(dynamic dbList) {
    List<PengajuanModels> parsedList = [];
    if (dbList is List) {
      for (var item in dbList) {
        PengajuanModels models = PengajuanModels.fromJson(item);
        parsedList.add(models);
      }
    }
    return parsedList;
  }

  Future<bool> editPengajuan(int idPengajuan, int idStatus) async {
    try {
      isLoading.value = true;
      int statusCode = await _servicespersetujuan.patchPersetujuan(
        idPengajuan,
        idStatus,
      );
      if (statusCode == 200) {
        Get.snackbar(
          'Sukses',
          'Selesai ditanggapi',
        );
        expandedId.value = '';
        await Future.delayed(
          Duration(
            seconds: 2,
          ),
        );
        return true;
      } else if (statusCode == 400) {
        Get.snackbar(
          'Gagal',
          'Gagal merubah status',
        );
        return false;
      } else {
        Get.snackbar(
          'Gagal',
          'Terjadi kesalahan',
        );
        return false;
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Tidak terkoneksi ke server',
      );
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
        dataPengajuan.assignAll(parseList(data));
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal ambil data',
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchPengajuanId(int? userId) async {
    if (userId == null) return;
    isLoading.value = true;
    try {
      final result = await _servicespengajuan.getIdPengajuan(userId);
      dataPengajuan.assignAll(parseList(result));
    } catch (e) {
      dataPengajuan.clear();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getPengajuanByRole(int userid, int role) async {
    isLoading.value = true;
    try {
      if (role == 2) {
        final data = await _servicespengajuan.getIdPengajuan(userid);
        dataPengajuan.assignAll(parseList(data));
      } else {
        final data = await _servicespengajuan.getAllPengajuan();
        dataPengajuan.assignAll(parseList(data));
      }
    } catch (e) {
      dataPengajuan.clear();
    } finally {
      isLoading.value = false;
    }
  }
}
