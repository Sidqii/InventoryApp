import 'package:get/get.dart';
import 'package:pusdatin_end/model/app_riwayat.dart';
import 'package:pusdatin_end/services/common/ServicesRiwayat.dart';

class CtrlRiwayat extends GetxController {
  final isloading = false.obs;
  final services = ServicesRiwayat();
  final riwayat = <AppRiwayatModel>[].obs;

  bool fetch = false;

  void onInit() {
    Future.microtask(() async {
      if (!fetch) {
        // FetchAllRequest();
        // FetchAllApprove();
        FetchRiwayat();
        print('data: ${FetchRiwayat()}');
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

      riwayat.assignAll([...reqq, ...appr]);
    } catch (e) {
      riwayat.clear();
      return;
    } finally {
      isloading.value = false;
    }
  }

  // Future<void> FetchAllRequest() async {
  //   isloading.value = true;

  //   try {
  //     final data = await services.GetAllRequest();

  //     riwayat.assignAll(data);
  //   } catch (e) {
  //     riwayat.clear();
  //     return;
  //   } finally {
  //     isloading.value = false;
  //   }
  // }

  // Future<void> FetchAllApprove() async {
  //   isloading.value = true;

  //   try {
  //     final data = await services.GetAllApprove();

  //     riwayat.assignAll(data);
  //   } catch (e) {
  //     riwayat.clear();
  //     return;
  //   } finally {
  //     isloading.value = false;
  //   }
  // }
}
