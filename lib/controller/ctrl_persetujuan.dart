import 'package:get/get.dart';
import 'package:pusdatin_end/controller/ctrl_user.dart';
import 'package:pusdatin_end/dataset/model/pengajuan.dart';
import 'package:pusdatin_end/services/services_pengajuan.dart';
import 'package:pusdatin_end/services/services_persetujuan.dart';

class CtrlPersetujuan extends GetxController {
  final servpersetujuan = ServicesPersetujuan();
  final servpengajuan = ServicesPengajuan();

  final ctrluser = Get.find<CtrlUser>().user.value!;

  @override
  void onInit() {
    super.onInit();
    final roleuser = ctrluser.role ?? 0;
    final iduser = ctrluser.id;
    getPengajuanByRole(iduser, roleuser);
  }

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
      int statusCode = await servpersetujuan.patchPersetujuan(
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
      var data = await servpengajuan.getAllPengajuan();

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
      final result = await servpengajuan.getIdPengajuan(userId);
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
        final data = await servpengajuan.getIdPengajuan(userid);
        dataPengajuan.assignAll(parseList(data));
      } else {
        final data = await servpengajuan.getAllPengajuan();
        dataPengajuan.assignAll(parseList(data));
      }
    } catch (e) {
      dataPengajuan.clear();
    } finally {
      isLoading.value = false;
    }
  }
}
