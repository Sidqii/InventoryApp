import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:inven/app/data/models/AppBarang.dart';
import 'package:inven/app/data/models/AppJenis.dart';
import 'package:inven/app/data/models/AppKategori.dart';
import 'package:inven/app/data/services/services_get.dart';
import 'package:inven/app/data/services/services_update.dart';
import 'package:inven/app/global/controllers/global_inven_controller.dart';

class OperatorEditController extends GetxController {
  final servUpdt = ServicesUpdate();

  final controller = Get.find<GlobalInvenController>();

  var isLoading = false.obs;

  var listJenis = <AppJenis>[].obs;
  var listKategori = <AppKategori>[].obs;

  final ctrlDesk = TextEditingController();
  final ctrlSpek = TextEditingController();
  final ctrlNote = TextEditingController();
  final ctrlMerk = TextEditingController();
  final ctrlBarang = TextEditingController();
  final ctrlSumVendor = TextEditingController();

  var ctrlKategori = 0.obs;
  var ctrlJenis = 0.obs;

  final fcsDesk = FocusNode();
  final fcsSpek = FocusNode();
  final fcsNote = FocusNode();
  final fcsMerk = FocusNode();
  final fcsJenis = FocusNode();
  final fcsBarang = FocusNode();
  final fcsKategori = FocusNode();
  final fcsSumVendor = FocusNode();

  @override
  void onInit() {
    super.onInit();
    fetchOpsi();
  }

  void initData(AppBarang model) {
    ctrlMerk.text = model.merk;
    ctrlJenis.value = model.jenisId;
    ctrlDesk.text = model.deskripsi!;
    ctrlSpek.text = model.spkBarang!;
    ctrlSumVendor.text = model.vendor;
    ctrlBarang.text = model.nmBarang;
    ctrlNote.text = model.note!;
    ctrlKategori.value = model.kategoriId;
  }

  Future<void> fetchOpsi() async {
    try {
      final jenis = await ServicesGet().dataJenis();
      final kategori = await ServicesGet().dataKategori();

      listJenis.assignAll(jenis);
      listKategori.assignAll(kategori);
    } catch (e) {
      Get.snackbar('Error', 'Gagal fetch opsi: $e');
    }
  }

  Future<void> updateBarang(int id) async {
    try {
      isLoading.value = true;

      final data = AppBarang(
        id: id,
        nmBarang: ctrlBarang.text,
        kdBarang: "",
        kategoriId: ctrlKategori.value,
        jenisId: ctrlJenis.value,
        merk: ctrlMerk.text,
        spkBarang: ctrlSpek.text,
        deskripsi: ctrlDesk.text,
        pengadaan: "",
        garansi: 0,
        sumBarang: "",
        vendor: ctrlSumVendor.text,
        note: ctrlNote.text,
      );

      final success = await servUpdt.updtItem(id, data);

      controller.refresh();

      isLoading.value = false;

      if (success) {
        Get.back();
        Get.snackbar('Berhasil', 'Barang berhasil diperbarui');
      } else {
        Get.snackbar('Gagal', 'Barang gagal diperbarui');
      }
    } catch (e) {
      Get.snackbar('Error', 'Error memperbarui barang');
    } finally {
      isLoading.value = false;
    }
  }

  void onClose() {
    ctrlDesk.dispose();
    ctrlSpek.dispose();
    ctrlNote.dispose();
    ctrlMerk.dispose();
    ctrlBarang.dispose();
    ctrlSumVendor.dispose();
    super.onClose();
  }
}
