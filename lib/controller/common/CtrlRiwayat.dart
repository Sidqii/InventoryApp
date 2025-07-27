import 'package:get/get.dart';
import 'package:pusdatin_end/model/app_persetujuan.dart';
import 'package:pusdatin_end/model/app_riwayat.dart';
import 'package:pusdatin_end/services/common/ServicesRiwayat.dart';

class CtrlRiwayat extends GetxController {
  final isloading = false.obs;

  final services = ServicesRiwayat();

  final riwayat = <AppRiwayatModel>[].obs;
  final approve = <AppPersetujuanModel>[].obs;

  bool fetch = false;

  void onInit() {
    Future.microtask(() async {
      if (!fetch) {
        await FetchRiwayat();
        fetch = true;
      }
    });
    super.onInit();
  }

  Future<void> refresh() async {
    isloading.value = true;

    await Future.delayed(Duration(seconds: 3));

    await FetchRiwayat();

    await Future.delayed(Duration(seconds: 3));

    isloading.value = false;
  }

  Future<void> FetchRiwayat() async {
    isloading.value = true;

    try {
      final reqq = await services.GetAllRequest();
      final appr = await services.GetAllApprove();

      riwayat.assignAll(reqq);
      approve.assignAll(appr);
    } catch (e) {
      riwayat.clear();
      return;
    } finally {
      isloading.value = false;
    }
  }
}
