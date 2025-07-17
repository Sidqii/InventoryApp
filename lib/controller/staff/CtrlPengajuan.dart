import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/common/CtrlRiwayat.dart';
import 'package:pusdatin_end/controller/common/CtrlUser.dart';
import 'package:pusdatin_end/model/app_barang.dart';
import 'package:pusdatin_end/model/app_pengajuan.dart';
import 'package:pusdatin_end/services/common/ServicesInven.dart';
import 'package:pusdatin_end/services/staff/ServicesPengajuan.dart';

class CtrlPengajuan extends GetxController {
  final ctrl = Get.find<CtrlRiwayat>();
  final barang = ServicesInven();
  final services = ServicesPengajuan();
  final formkey = GlobalKey<FormState>();

  var isLoading = false.obs;
  var daftaritems = <AppBarangModel>[].obs;
  var listajukan = <AppPengajuanModel>[].obs;
  var selectedItem = RxnInt();
  var selectedName = RxnString();
  var stokItem = 0.obs;

  final ctrljumlah = TextEditingController();
  final ctrlinstansi = TextEditingController();
  final ctrlhal = TextEditingController();
  final ctrlkembali = DateTime.now().obs;

  final fcsjumlah = FocusNode();
  final fcsinstansi = FocusNode();
  final fcshal = FocusNode();

  Key dropdownkey = UniqueKey();

  Future<void> refreshed() async {
    await Future.delayed(Duration(seconds: 2));
    await loaditem(isloaded: true);
  }

  void resetForm() {
    ctrljumlah.clear();
    ctrlinstansi.clear();
    ctrlhal.clear();
    ctrlkembali.value = DateTime.now();
    selectedItem.value = null;
    selectedName.value = null;
    stokItem.value = 0;
    dropdownkey = UniqueKey();
  }

  @override
  void onInit() {
    loaditem();
    super.onInit();
  }

  @override
  void onClose() {
    ctrlhal.dispose();
    ctrljumlah.dispose();
    ctrlinstansi.dispose();
    fcsinstansi.dispose();
    fcsjumlah.dispose();
    fcshal.dispose();
    super.onClose();
  }

  Future<void> loaditem({bool isloaded = false}) async {
    final data = await barang.getItems();
    daftaritems.assignAll(data);
  }

  Future<void> ajukan() async {
    if (formkey.currentState!.validate()) {
      final user = Get.find<CtrlUser>().user.value!;
      isLoading.value = true;

      final success = await kirimPengajuan(
        selectedItem.value ?? 0,
        user.id,
        ctrlinstansi.text,
        ctrlhal.text,
        int.tryParse(ctrljumlah.text) ?? 0,
        ctrlkembali.toString(),
      );

      if (success) {
        resetForm();
        loaditem();
        ctrl.FetchAll();
      }

      isLoading.value = false;
    }
  }

  Future<bool> kirimPengajuan(
    int barang,
    int pengguna,
    String instansi,
    String hal,
    int jumlah,
    String kembali,
  ) async {
    try {
      int statusCode = await services.postPengajuan(
        barang,
        pengguna,
        instansi,
        hal,
        jumlah,
        kembali,
      );

      if (statusCode == 200) {
        Get.snackbar('Sukses', 'Pengajuan berhasil');
        await Future.delayed(Duration(seconds: 2));
        return true;
      } else if (statusCode == 400) {
        Get.snackbar('Gagal', 'Gagal melakukan pengajuan');
        return false;
      } else {
        Get.snackbar('Gagal', 'Terjadi kesalahan');
        return false;
      }
    } catch (e) {
      Get.snackbar('Error', 'Tidak terkoneksi ke server');
      return false;
    }
  }
}
