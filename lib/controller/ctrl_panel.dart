import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/ctrl_pengajuan.dart';
import 'package:pusdatin_end/services/services_items.dart';

class CtrlPanel extends GetxController {
  Future<void> loadItems() async {
    final services = ServicesItems();
    final data = await services.getItems();
    daftarBarang.assignAll(data);
  }

  void onInit() {
    super.onInit();
  }

  final isLoading = false.obs;
  final formkey = GlobalKey<FormState>();

  RxList<Map<String, dynamic>> daftarBarang = <Map<String, dynamic>>[].obs;
  RxInt? selectedItemId;
  RxString? selectedItemName;
  RxInt stok = 0.obs;

  final jumlahCtrl = TextEditingController();
  final tanggalCtrl = TextEditingController();
  final instansiCtrl = TextEditingController();
  final halCtrl = TextEditingController();

  final jumlaFcs = FocusNode();
  final tanggalFcs = FocusNode();
  final instansiFcs = FocusNode();
  final halFcs = FocusNode();

  void reset() {
    jumlahCtrl.clear();
    tanggalCtrl.clear();
    instansiCtrl.clear();
    halCtrl.clear();
    selectedItemId?.value = 0;
    selectedItemName?.value = '';
    stok.value = 0;
  }

  Future<void> ajukan(int userId) async {
    if (formkey.currentState!.validate()) {
      isLoading.value = true;
      final success = await CtrlPengajuan().kirimPengajuan(
        userId,
        selectedItemId?.value ?? 0,
        int.tryParse(jumlahCtrl.text) ?? 0,
        tanggalCtrl.text,
        instansiCtrl.text,
        halCtrl.text,
      );
      if (success) {
        reset();
      }
      isLoading.value = false;
    }
  }

  void onClose() {
    jumlahCtrl.dispose();
    tanggalCtrl.dispose();
    instansiCtrl.dispose();
    halCtrl.dispose();
    jumlaFcs.dispose();
    tanggalFcs.dispose();
    instansiFcs.dispose();
    halFcs.dispose();
    super.onClose();
  }
}
