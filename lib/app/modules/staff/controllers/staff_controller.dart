import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:inven/app/data/models/AppBarang.dart';
import 'package:inven/app/data/models/AppPengembalian.dart';
import 'package:inven/app/data/models/AppUnitBarang.dart';
import 'package:inven/app/data/services/services_get.dart';
import 'package:inven/app/data/services/services_post.dart';
import 'package:inven/app/global/controllers/global_user_controller.dart';

class StaffController extends GetxController {
  //services dan controller
  final userData = Get.find<GlobalUserController>().user.value;
  final services = ServicesPost();
  final servitem = ServicesGet();

  final itemList = <AppBarang>[].obs;
  final unitList = <AppUnitBarang>[].obs;
  final pinjamlist = <AppPengembalian>[].obs;

  var slctItemId = RxnInt(); //dropdown id barang
  var slctNmItem = RxnString(); //dropdown nama barang
  var stokItem = 0.obs;

  var slctUnitId = <int>[].obs; //dropdown id unit
  var isCheckAll = false.obs;

  var isLoading = false.obs;

  Key dropitem = UniqueKey();
  Key dropunit = UniqueKey();

  final ctrlPemohon = TextEditingController();
  final ctrlInstansi = TextEditingController();
  final ctrlHal = TextEditingController();
  final ctrlKembali = DateTime.now().obs;
  final ctrlPinjam = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();

    fetchData();

    if (userData != null) {
      ctrlPemohon.text = userData!.nama;
      ctrlInstansi.text = userData!.inst;
    }
  }

  @override
  void onClose() {
    ctrlInstansi.dispose();
    ctrlPemohon.dispose();
    ctrlHal.dispose();
    super.onClose();
  }

  void chekAll(bool val) {
    final list = unitFilt.isEmpty ? unitList : unitFilt;

    if (val) {
      slctUnitId.assignAll(
        list.map((u) {
          return u.id;
        }),
      );
      isCheckAll.value = true;
    } else {
      slctUnitId.clear();
      isCheckAll.value = false;
    }
    slctUnitId.refresh();
  }

  void updateCheck() {
    final list = unitFilt.isEmpty ? unitList : unitFilt;

    isCheckAll.value = slctUnitId.length == list.length;

    slctUnitId.refresh();
  }

  Future<void> fetchData() async {
    try {
      isLoading.value = true;

      //get peminjaman barang
      final pinjam = await servitem.getPengembalian();

      //get data barang
      final barang = await servitem.getBarang();

      //get unit barang
      final unit = await servitem.getUnit();

      pinjamlist.assignAll(pinjam);
      itemList.assignAll(barang);
      unitList.assignAll(unit);
    } catch (e) {
      Get.snackbar('Error', 'Error fetch data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  //data filter unit barang
  List<AppUnitBarang> get unitFilt {
    if (slctItemId.value == null) return [];

    return unitList.where((u) {
      return u.barang!.id == slctItemId.value;
    }).toList();
  }

  Future<void> pengajuan() async {
    final user = Get.find<GlobalUserController>().user.value;

    try {
      isLoading.value = true;

      final response = await services.postPengajuan(
        user!.id,
        ctrlInstansi.text,
        ctrlHal.text,
        ctrlPinjam.toString(),
        ctrlKembali.toString(),
        slctUnitId.toList(),
      );

      if (response != null) {
        Get.snackbar('Sukses', 'Pengajuan peminjaman berhasil');
      } else {
        Get.snackbar('Gagal', 'Gagal mengajukan peminjaman');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan pengajuan');
    } finally {
      isLoading.value = false;
    }
  }
}
