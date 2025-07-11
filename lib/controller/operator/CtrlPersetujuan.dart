import 'package:get/get.dart';
import 'package:pusdatin_end/controller/common/CtrlUser.dart';
import 'package:pusdatin_end/model/app_riawayat.dart';
import 'package:pusdatin_end/services/operator/ServicesPersetujuan.dart';
import 'package:pusdatin_end/services/operator/ServicesRiwayat.dart';

class CtrlPersetujuan extends GetxController {
  final servpersetujuan = ServicesPersetujuan();
  final servriwayat = ServicesRiwayat();

  final ctrluser = Get.find<CtrlUser>().user.value!;

  bool _hasinit = false;

  @override
  void onInit() {
    super.onInit();
    Future.microtask(() async {
      final roleuser = ctrluser.role ?? 0;
      final iduser = ctrluser.id;
      if (!_hasinit) {
        getPengajuanByRole(iduser, roleuser);
        _hasinit = true;
      }
    });
  }

  Future<void> refresehed() async {
    isLoading.value = true;

    await Future.delayed(Duration(seconds: 3));
    final user = Get.find<CtrlUser>().user.value!;

    await getPengajuanByRole(user.id, user.role ?? 0);
    await Future.delayed(Duration(seconds: 2));

    isLoading.value = false;
  }

  final riwayat = <RiwayatModel>[].obs;

  final isLoading = false.obs;
  final expandedId = ''.obs;

  List<RiwayatModel> parseList(dynamic dbList) {
    List<RiwayatModel> parsedList = [];
    if (dbList is List) {
      for (var item in dbList) {
        RiwayatModel models = RiwayatModel.fromJson(item);
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
        refresehed();
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

  Future<void> getPengajuanByRole(int userid, int role) async {
    isLoading.value = true;
    try {
      if (role == 2) {
        final data = await servriwayat.getIdRiwayat(userid);
        // print('Data yang didapat: $data');
        riwayat.assignAll(parseList(data));
      } else {
        final data = await servriwayat.getAllRiwayat();
        // print('Data yang didapat: $data');
        riwayat.assignAll(parseList(data));
      }
    } catch (e) {
      riwayat.clear();
    } finally {
      isLoading.value = false;
    }
  }
}
