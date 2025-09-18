import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/data/models/AppPengajuan.dart';
import 'package:inven/app/data/models/AppUnitBarang.dart';
import 'package:inven/app/data/models/AppUser.dart';
import 'package:inven/app/data/services/services_get.dart';
import 'package:inven/app/data/services/services_update.dart';
import 'package:inven/app/global/controllers/global_user_controller.dart';
import 'package:inven/app/modules/login/controllers/login_controller.dart';
import 'package:inven/app/modules/login/views/login_view.dart';

class OperatorController extends GetxController {
  final userCtrl = Get.find<GlobalUserController>();
  final services = ServicesGet();

  AppUser? get userData => userCtrl.user.value;

  final expandP = ''.obs; //expand proses
  final expandR = ''.obs; //expand riwayat
  final expandB = ''.obs; //expand pengembalian (back)

  var bttnLoad = false.obs; //loading indikator
  var isLoading = false.obs; //loading value

  var selectUnit = <int, bool>{}.obs;
  final ctrlNote = TextEditingController();

  final pengajuan = <AppPengajuan>[].obs;
  final kembalian = <AppPengajuan>[].obs;
  final riwayatAll = <AppPengajuan>[].obs;
  var riwayatFilter = <AppPengajuan>[].obs;

  final Map<int, String> opsiFilter = {
    0: '|||',
    8: 'Proses',
    1: 'Ditolak',
    4: 'Dipinjam',
    2: 'Selesai',
  };
  var selectOpsi = 0.obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void filterChips() {
    int select = selectOpsi.value;

    if (select == 0) {
      riwayatFilter.assignAll(riwayatAll);
    } else if (select == 8) {
      riwayatFilter.assignAll(
        riwayatAll
            .where((r) => r.status?.id == 3 || r.status?.id == 5)
            .toList(),
      );
    } else if (select == 2) {
      riwayatFilter.assignAll(
        riwayatAll
            .where((r) => r.status?.id == 2 || r.status?.id == 6)
            .toList(),
      );
    } else {
      riwayatFilter.assignAll(
        riwayatAll.where((r) => r.status?.id == select).toList(),
      );
    }
  }

  void doLogout() {
    Get.offAll(
      () => LoginView(),
      binding: BindingsBuilder(() {
        Get.put(GlobalUserController());
        Get.put(LoginController());
      }),
    );
  }

  void initUnit(List<AppUnitBarang> units) {
    selectUnit.clear();
    for (final u in units) {
      selectUnit[u.id] = false;
    }
  }

  List<Map<String, dynamic>> getSelectUnit() {
    return selectUnit.entries
        .where((e) => e.value == true)
        .map(
          (e) => {
            'id_unit': e.key,
            'status_baru': 1,
            'catatan': ctrlNote.text.isNotEmpty ? ctrlNote.text : null,
          },
        )
        .toList();
  }

  Future<void> updtData(int id, int statusId) async {
    try {
      bttnLoad.value = true;

      final note = ctrlNote.text;
      final result = await ServicesUpdate().prosesAppr(id, statusId, note);

      if (result != null) {
        Get.snackbar(
          'Sukses',
          statusId == 4 ? 'Pengajuan disetujui' : 'Pengajuan ditolak',
        );
      } else {
        Get.snackbar('Gagal', 'Terjadi kegagalan proses');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan $e');
    } finally {
      bttnLoad.value = false;
    }
  }

  Future<void> pengembalian(int id) async {
    try {
      isLoading.value = true;
      bttnLoad.value = true;

      final unit = getSelectUnit();
      final result = await ServicesUpdate().prosesRett(id, unit);

      if (result != null) {
        Get.back();
        Get.snackbar('Sukses', 'Pengembalian diproses');
      } else {
        Get.snackbar('Gagal', 'Pengembalian gagal');
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'message: $e');
    } finally {
      isLoading.value = false;
      bttnLoad.value = false;
    }
  }

  Future<void> refresh() async {
    isLoading.value = true;

    await Future.delayed(Duration(seconds: 1));

    await fetchData();

    await Future.delayed(Duration(seconds: 1));

    isLoading.value = false;
  }

  Future<void> fetchData() async {
    try {
      isLoading.value = true;

      final dataPengajuan = await services.indexApp();
      final pengembalian = await services.returnApp();
      final riwayatData = await services.indexAll();

      pengajuan.assignAll(dataPengajuan);
      kembalian.assignAll(pengembalian);
      riwayatAll.assignAll(riwayatData);
      print('cek status: ${riwayatAll.map((e) => e.status?.id)}');
      riwayatFilter.assignAll(riwayatData);
    } catch (e) {
      Get.snackbar('Error', 'Error fetch data controller');
    } finally {
      isLoading.value = false;
    }
  }
}
