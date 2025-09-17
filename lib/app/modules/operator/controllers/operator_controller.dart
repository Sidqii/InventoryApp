import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/data/models/AppPengajuan.dart';
import 'package:inven/app/data/models/AppUnitBarang.dart';
import 'package:inven/app/data/models/AppUser.dart';
import 'package:inven/app/data/services/services_get.dart';
import 'package:inven/app/global/controllers/global_user_controller.dart';
import 'package:inven/app/modules/login/controllers/login_controller.dart';
import 'package:inven/app/modules/login/views/login_view.dart';

class OperatorController extends GetxController {
  final userCtrl = Get.find<GlobalUserController>();
  final services = ServicesGet();

  AppUser? get userData => userCtrl.user.value;

  final isExpand = ''.obs; //pemantauan expand

  var isBtnLoad = false.obs; //loading indikator
  var isLoading = false.obs; //loading value

  var selectUnit = <int, bool>{}.obs;
  final ctrlNote = TextEditingController();

  final pengajuan = <AppPengajuan>[].obs;
  final kembalian = <AppPengajuan>[].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
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

  // void checkAll() {
  //   final list
  // }

  List<Map<String, dynamic>> getSelectUnit() {
    return selectUnit.entries
        .where((e) => e.value == true)
        .map((e) => {'id_unit': e.key, 'status_baru': 9})
        .toList();
  }

  Future<void> fetchData() async {
    try {
      isLoading.value = true;

      final dataPengajuan = await services.indexApp();
      final pengembalian = await services.returnApp();

      pengajuan.assignAll(dataPengajuan);
      kembalian.assignAll(pengembalian);
    } catch (e) {
      Get.snackbar('Error', 'Error fetch data controller');
    } finally {
      isLoading.value = false;
    }
  }
}
