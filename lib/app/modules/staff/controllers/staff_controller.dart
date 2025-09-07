import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:inven/app/data/models/AppBarang.dart';
import 'package:inven/app/data/models/AppPengajuan.dart';
import 'package:inven/app/data/models/AppUnitBarang.dart';
import 'package:inven/app/data/models/AppUser.dart';
import 'package:inven/app/data/services/services_get.dart';
import 'package:inven/app/data/services/services_post.dart';

import 'package:inven/app/global/controllers/global_user_controller.dart';
import 'package:inven/app/modules/login/controllers/login_controller.dart';
import 'package:inven/app/modules/login/views/login_view.dart';

class StaffController extends GetxController {
  //controller
  final userCtrl = Get.find<GlobalUserController>();
  AppUser? get userData => userCtrl.user.value;

  //services
  final services = ServicesPost();
  final servitem = ServicesGet();

  //data model
  final itemList = <AppBarang>[].obs;
  final unitList = <AppUnitBarang>[].obs;
  final riwayatList = <AppPengajuan>[].obs;
  final pinjamlist = <AppPengajuan>[].obs;

  var isLoading = false.obs;

  final expandR = ''.obs;
  final expandP = ''.obs;

  var isIndex = 0.obs; //index navigasi

  //filter komponen
  var riwayatFltr = <AppPengajuan>[].obs;
  final Map<int, String> opsFltr = {
    0: '|||',
    7: 'Pending',
    3: 'Disetujui',
    4: 'Ditolak',
    8: 'Selesai',
  };
  var slctOps = 0.obs;

  //dropdown obsverserable
  var slctItemId = RxnInt(); //dropdown id barang
  var slctUnitId = <int>[].obs; //dropdown id unit
  var isCheckAll = false.obs;

  //key dropdown
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

  void doLogout() {
    Get.offAll(
      () => LoginView(),
      binding: BindingsBuilder(() {
        Get.put(GlobalUserController());
        Get.put(LoginController());
      }),
    );
  }

  //fungsi navigasi
  void onChangePage(int index) {
    isIndex.value = index;
  }

  //ceklist all unit
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

  //fetch ulang form
  Future<void> refresh() async {
    isLoading.value = true;

    await Future.delayed(Duration(seconds: 1));

    await fetchData();

    await Future.delayed(Duration(seconds: 1));

    isLoading.value = false;
  }

  //membersihkan form
  void resetForm() {
    ctrlPemohon.text = userData?.nama ?? '';
    ctrlPemohon.text = userData?.inst ?? '';
    ctrlHal.clear();

    ctrlPinjam.value = DateTime.now();
    ctrlKembali.value = DateTime.now();

    slctItemId.value = null;
    slctUnitId.clear();
    isCheckAll.value = false;

    dropitem = UniqueKey();
    dropunit = UniqueKey();

    slctUnitId.refresh();
    update();
  }

  //periksa ceklist unit
  void updateCheck() {
    final list = unitFilt.isEmpty ? unitList : unitFilt;

    isCheckAll.value = slctUnitId.length == list.length;

    slctUnitId.refresh();
  }

  //fungsi filter
  void filterChips() {
    int select = slctOps.value;

    List<AppPengajuan> data = riwayatList;

    if (select != 0) {
      data = data.where((r) {
        return r.status?.id == select;
      }).toList();
    }

    riwayatFltr.assignAll(data);
  }

  //fetch data
  Future<void> fetchData() async {
    try {
      isLoading.value = true;

      //get riwayat
      final pinjam = await servitem.getPinjam(userData!.id);

      //get riwayat
      final riwayat = await servitem.getRiwayat(userData!.id);

      //get data barang
      final barang = await servitem.getBarang();

      //get unit barang
      final unit = await servitem.getUnitStaff();

      //data barang
      itemList.assignAll(barang);

      //data unit barang
      unitList.assignAll(unit);

      //data peminjaman
      pinjamlist.assignAll(pinjam);

      //data riwayat staff
      riwayatList.assignAll(riwayat);

      riwayatFltr.assignAll(riwayat);
    } catch (e) {
      Get.snackbar('Error', 'Error fetch data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  //data filter unit dropdown
  List<AppUnitBarang> get unitFilt {
    if (slctItemId.value == null) return [];

    return unitList.where((u) {
      return u.barang!.id == slctItemId.value;
    }).toList();
  }

  //melakukan pengajuan
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
