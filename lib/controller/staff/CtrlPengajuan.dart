import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/common/CtrlUser.dart';
import 'package:pusdatin_end/controller/operator/CtrlPersetujuan.dart';
import 'package:pusdatin_end/dataset/model/app_barang.dart';
import 'package:pusdatin_end/services/common/ServicesInven.dart';
import 'package:pusdatin_end/services/staff/ServicesPengajuan.dart';

class CtrlPengajuan extends GetxController {
  final dropitem = ServicesInven();
  final services = ServicesPengajuan();
  final formkey = GlobalKey<FormState>();

  var isLoading = false.obs;
  var daftaritems = <AppBarangModel>[].obs;
  var selectedItem = RxnInt();
  var selectedName = RxnString();
  var stokItem = 0.obs;

  final jumlahctrl = TextEditingController();
  final tglcontrol = TextEditingController();
  final instansictrl = TextEditingController();
  final halcontrol = TextEditingController();

  final jumlahfocus = FocusNode();
  final tglfocus = FocusNode();
  final instansifocus = FocusNode();
  final halfocus = FocusNode();

  Key dropdownkey = UniqueKey();

  Future<void> refreshed() async {
    await Future.delayed(Duration(seconds: 2));
    await loaditem(isloaded: true);
  }

  void resetForm() {
    jumlahctrl.clear();
    tglcontrol.clear();
    instansictrl.clear();
    halcontrol.clear();

    selectedItem.value = null;
    selectedName.value = null;
    stokItem.value = 0;
    dropdownkey = UniqueKey();
  }

  List<AppBarangModel> parsedList(dynamic dblist) {
    List<AppBarangModel> parsedList = [];
    if (dblist is List) {
      for (var item in dblist) {
        AppBarangModel models = AppBarangModel.fromJson(item);
        parsedList.add(models);
      }
    }
    return parsedList;
  }

  @override
  void onInit() {
    super.onInit();
    loaditem();
  }

  @override
  void onClose() {
    jumlahctrl.dispose();
    tglcontrol.dispose();
    halcontrol.dispose();
    instansictrl.dispose();

    instansifocus.dispose();
    jumlahfocus.dispose();
    tglfocus.dispose();
    halfocus.dispose();
    super.onClose();
  }

  Future<void> loaditem({bool isloaded = false}) async {
    final data = await dropitem.getItems();
    daftaritems.assignAll(parsedList(data));
  }

  Future<void> ajukan() async {
    if (formkey.currentState!.validate()) {
      final user = Get.find<CtrlUser>().user.value!;
      isLoading.value = true;

      final success = await kirimPengajuan(
        user.id,
        selectedItem.value ?? 0,
        int.tryParse(jumlahctrl.text) ?? 0,
        tglcontrol.text,
        instansictrl.text,
        halcontrol.text,
      );

      if (success) {
        resetForm();
        loaditem();

        final user = Get.find<CtrlUser>().user.value!;
        final ctrl = Get.find<CtrlPersetujuan>();
        ctrl.getPengajuanByRole(user.id, user.role ?? 0);
      }

      isLoading.value = false;
    }
  }

  Future<bool> kirimPengajuan(
    int idPengguna,
    int idBarang,
    int jumlah,
    String tglKembali,
    String instansi,
    String hal,
  ) async {
    try {
      int statusCode = await services.postPengajuan(
        idPengguna,
        idBarang,
        jumlah,
        tglKembali,
        instansi,
        hal,
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
