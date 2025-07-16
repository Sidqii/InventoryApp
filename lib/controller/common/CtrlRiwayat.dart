import 'package:get/get.dart';
import 'package:pusdatin_end/controller/common/CtrlUser.dart';
import 'package:pusdatin_end/model/app_riwayat.dart';
import 'package:pusdatin_end/services/common/ServicesRiwayat.dart';

class CtrlRiwayat extends GetxController {
  final isloading = false.obs;
  final services = ServicesRiwayat();
  final riwayat = <AppRiwayatModel>[].obs;

  void onInit() {
    FetchAll();
    super.onInit();
  }

  Future<void> refresh() async {
    isloading.value = true;

    await Future.delayed(Duration(seconds: 3));
    final user = Get.find<CtrlUser>().user.value!;

    await FetchID(user.id);
    await Future.delayed(Duration(seconds: 3));

    isloading.value = false;
  }

  Future<void> FetchAll() async {
    isloading.value = true;

    try {
      final data = await services.GetAll();

      riwayat.assignAll(data);
    } catch (e) {
      riwayat.clear();
      return;
    } finally {
      isloading.value = false;
    }
  }

  Future<void> FetchID(int id) async {
    isloading.value = true;

    try {
      final data = await services.GetID(id);

      riwayat.assignAll(data);
    } catch (e) {
      riwayat.clear();
      return;
    } finally {
      isloading.value = false;
    }
  }
}
