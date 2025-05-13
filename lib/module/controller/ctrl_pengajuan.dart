import 'package:get/get.dart';
import 'package:pusdatin_end/module/services/services_pengajuan.dart';

class CtrlPengajuan extends GetxController {
  var listPengajuan = [].obs;
  var isLoading = false.obs;

  final ServicesPengajuan _services = Get.put(ServicesPengajuan());

  @override
  void onInit() {
    super.onInit();
    fetchPengajuan();
  }

  void fetchPengajuan() async {
    isLoading.value = true;
    try {
      final data = await _services.getPengajuan();
      listPengajuan.value = data;
    } catch (e) {
      listPengajuan.value = [];
    }
    isLoading.value = false;
  }
}
