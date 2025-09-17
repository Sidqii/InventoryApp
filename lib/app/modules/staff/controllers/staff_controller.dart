import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:inven/app/data/models/AppBarang.dart';
import 'package:inven/app/data/models/AppPengajuan.dart';
import 'package:inven/app/data/models/AppUnitBarang.dart';
import 'package:inven/app/data/models/AppUser.dart';
import 'package:inven/app/data/services/services_get.dart';
import 'package:inven/app/data/services/services_post.dart';
import 'package:inven/app/data/services/services_update.dart';
import 'package:inven/app/global/controllers/global_inven_controller.dart';

import 'package:inven/app/global/controllers/global_user_controller.dart';
import 'package:inven/app/modules/login/controllers/login_controller.dart';
import 'package:inven/app/modules/login/views/login_view.dart';

class StaffController extends GetxController {
  //controller data pengguna
  final userCtrl = Get.find<GlobalUserController>();
  AppUser? get userData => userCtrl.user.value;

  //services
  final servPut = ServicesUpdate();
  final servPst = ServicesPost();
  final servGet = ServicesGet();

  //data model yang difetch
  final itemList = <AppBarang>[].obs;
  final unitList = <AppUnitBarang>[].obs;
  final riwayatList = <AppPengajuan>[].obs;
  final pinjamlist = <AppPengajuan>[].obs;

  //nilai loading
  var isLoading = false.obs;
  var isBtnLoad = false.obs;
  var errorList = <String>[].obs;

  //pemantauan expand
  final expandR = ''.obs;
  final expandP = ''.obs;

  var isIndex = 0.obs; //index navigasi

  //komponen untuk filteChips
  final Map<int, String> opsFltr = {
    //data filter
    0: '|||',
    9: 'Pending',
    4: 'Disetujui',
    1: 'Ditolak',
    2: 'Selesai',
  };
  var riwayatFltr = <AppPengajuan>[].obs; //data yang dimunculkan
  var slctOps = 0.obs; //opsi yang dipilih

  //pemantauan untuk checkbox
  var slctItemId = RxnInt(); //checkbox id barang
  var slctUnitId = <int>[].obs; //checkbox id unit
  var isCheckAll = false.obs;

  //key dropdown
  Key dropitem = UniqueKey();
  Key dropunit = UniqueKey();

  //controller tiap input
  final ctrlPemohon = TextEditingController();
  final ctrlInstansi = TextEditingController();
  final ctrlKeperluan = TextEditingController();
  final tglPinjam = Rxn<DateTime>();
  final tglKembali = Rxn<DateTime>();

  //init awal app dimulai
  @override
  void onInit() {
    super.onInit();

    fetchData();

    if (userData != null) {
      ctrlPemohon.text = userData!.nama;
      ctrlInstansi.text = userData!.inst;
    }
  }

  //fungsi ketika app ditutup
  @override
  void onClose() {
    ctrlInstansi.dispose();
    ctrlPemohon.dispose();
    ctrlKeperluan.dispose();
    super.onClose();
  }

  //convert item dipilih dari dropdown (id) -> (nama barang)
  String? get selectedItem {
    final barang = itemList.firstWhereOrNull((i) {
      return i.id == slctItemId.value;
    });
    return barang?.nmBarang;
  }

  //logout app
  void doLogout() {
    Get.offAll(
      () => LoginView(),
      binding: BindingsBuilder(() {
        Get.put(GlobalUserController());
        Get.put(GlobalInvenController());
        Get.put(LoginController());
      }),
    );
  }

  //fungsi ceklist semua unit (checkBox)
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

  //periksa ceklist unit
  void updateCheck() {
    final list = unitFilt.isEmpty ? unitList : unitFilt;

    isCheckAll.value = slctUnitId.length == list.length;

    slctUnitId.refresh();
  }

  //fetch ulang form (refresh)
  Future<void> refresh() async {
    isLoading.value = true;

    await Future.delayed(Duration(seconds: 1));

    await fetchData();

    await Future.delayed(Duration(seconds: 1));

    isLoading.value = false;
  }

  //membersihkan form (reset)
  void resetForm() {
    ctrlPemohon.text = userData?.nama ?? '';
    ctrlInstansi.text = userData?.inst ?? '';
    ctrlKeperluan.clear();

    tglPinjam.value = null;
    tglKembali.value = null;

    slctItemId.value = null;
    slctUnitId.clear();
    isCheckAll.value = false;

    dropitem = UniqueKey();
    dropunit = UniqueKey();

    slctUnitId.refresh();
    update();
  }

  //data filter unit checkbox
  List<AppUnitBarang> get unitFilt {
    if (slctItemId.value == null) return [];

    return unitList.where((u) {
      return u.barang!.id == slctItemId.value;
    }).toList();
  }

  //fungsi filterchips
  void filterChips() {
    int select = slctOps.value;

    List<AppPengajuan> data = riwayatList;

    if (select == 0) {
      riwayatFltr.assignAll(data);
    } else if (select == 9) {
      riwayatFltr.assignAll(
        data.where((r) => r.status?.id == 3 || r.status?.id == 5).toList(),
      );
    } else {
      riwayatFltr.assignAll(data.where((r) => r.status?.id == select).toList());
    }
  }

  //fetch data
  Future<void> fetchData() async {
    try {
      isLoading.value = true;

      //get hanya riwayat peminjaman
      final pinjam = await servGet.getPinjam(userData!.id);

      //get semua riwayat
      final riwayat = await servGet.getRiwayat(userData!.id);

      //get data barang
      final barang = await servGet.getBarang();

      //get unit barang
      final unit = await servGet.getUnitStaff();

      //data barang
      itemList.assignAll(barang);

      //data unit barang
      unitList.assignAll(unit);

      //data peminjaman
      pinjamlist.assignAll(pinjam);

      //data riwayat staff
      riwayatList.assignAll(riwayat);

      //data riwayat difilter
      riwayatFltr.assignAll(riwayat);
    } catch (e) {
      Get.snackbar('Error', 'Error fetch data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  //melakukan pengajuan
  Future<void> pengajuan() async {
    final user = Get.find<GlobalUserController>().user.value;

    try {
      isLoading.value = true;

      final response = await servPst.postPengajuan(
        user!.id,
        ctrlInstansi.text,
        ctrlKeperluan.text,
        tglPinjam.toString(),
        tglKembali.toString(),
        slctUnitId.toList(),
      );

      if (response != null) {
        resetForm();

        refresh();

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

  Future<void> pengembalian(int id, List<int> uId, int sId) async {
    try {
      isLoading.value = true;

      final response = await servPut.prosesBack(id, uId, sId);

      if (response != null) {
        resetForm();

        refresh();

        Get.snackbar('Berhasil', 'Mengajukan pengembalian');
      } else {
        Get.snackbar('Gagal', 'Gagal melakukan pengembalian');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan pengembalian');
    } finally {
      isLoading.value = false;
    }
  }

  //fungsi navigasi page
  void onChangePage(int index) {
    isIndex.value = index;
  }

  //fungsi validasi form
  bool validateForm() {
    List<String> error = [];

    //validasi tanggal peminjaman
    if (tglPinjam.value == null) {
      error.add('Tanggal pinjam kosong!');
    } else {
      DateTime today = DateTime.now();

      DateTime nowDate = DateTime(today.year, today.month, today.day);

      DateTime pinjam = DateTime(
        tglPinjam.value!.year,
        tglPinjam.value!.month,
        tglPinjam.value!.day,
      );

      if (pinjam.isBefore(nowDate)) {
        error.add('Tanggal pinjam tidak valid');
      }
    }

    //validasi tanggal peminjaman
    if (tglKembali.value == null) {
      error.add('Tanggal kembali kosong!');
    } else if (tglPinjam.value != null) {
      DateTime kembali = DateTime(
        tglKembali.value!.year,
        tglKembali.value!.month,
        tglKembali.value!.day,
      );

      DateTime pinjam = DateTime(
        tglPinjam.value!.year,
        tglPinjam.value!.month,
        tglPinjam.value!.day,
      );

      if (kembali.isBefore(pinjam)) {
        error.add('Tanggal kembali tidak valid');
      }
    }

    //validasi barang
    if (slctItemId.value == null) {
      error.add('Data barang kosong!');
    }

    //valdasi unit barang
    if (slctUnitId.isEmpty) {
      error.add('Unit barang kosong!');
    }

    //inout semua error kedalam list
    errorList.assignAll(error);

    return error.isEmpty;
  }
}
