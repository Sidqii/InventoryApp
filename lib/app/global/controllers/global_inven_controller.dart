import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:inven/app/data/models/AppBarang.dart';
import 'package:inven/app/data/services/services_get.dart';

class GlobalInvenController extends GetxController {
  //controller untuk input teks dari TextField
  final ctrlFilter = TextEditingController();

  //proerti untuk handling interaksi user
  final fcsFilter = FocusNode();

  //nilai kategori yang akan dipilih user (default saat ini 0)
  var selectOpsi = 0.obs;

  Rx<Map<int, String>> opsiFilter = Rx({});

  //indikator loading (true == load dan false == idle)
  var isLoading = false.obs;

  //data barang yang difilter
  var filterBarang = <AppBarang>[].obs;

  //data seluruh barang dari API
  var barang = <AppBarang>[].obs;

  //timer untuk penunda eksekusi fungsi filter (combineFilter())
  Timer? _debounce;

  //penanda untuk data sudah fetch atau belum
  bool _hasFetch = false;

  @override
  void onInit() {
    super.onInit();
    Future.microtask(() async {
      if (!_hasFetch) {
        await fetchData();
        _hasFetch = true;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    ctrlFilter.dispose();
    fcsFilter.dispose();
  }

  Future<void> refresh() async {
    isLoading.value = true;

    await Future.delayed(Duration(seconds: 1));

    await fetchData(isRefresh: true);

    await Future.delayed(Duration(seconds: 2));

    isLoading.value = false;
  }

  Future<void> fetchData({bool isRefresh = false}) async {
    if (barang.isNotEmpty && !isRefresh) return;

    try {
      isLoading.value = true;

      List<AppBarang> item = await ServicesGet().dataBarang();

      barang.assignAll(item);

      filterBarang.assignAll(item);

      opsiFilter.value = {
        0: "|||",
        for (var barang in item)
          if (barang.kategori != null)
            barang.kategori!.id: barang.kategori!.kategori,
      };
    } catch (e) {
      print(e);
      Get.snackbar('error', 'Terjadi kesalahan');
    } finally {
      isLoading.value = false;
    }
  }

  void combineFilter() {
    ///mengambil teks dari input pengguna
    ///lalu mengubahnya menjadi huruf kecil (.toLowerCase()) untuk menghindari case sensitif
    String keyword = ctrlFilter.text.toLowerCase();

    ///mengambil nilai chip melalui pilihan user
    int select = selectOpsi.value;

    ///mengambil seluruh data barang (semua data barang tanpa filter)
    ///data barang nantinya akan difilter dengan berbagai kondisi
    List<AppBarang> item = barang;

    ///tahap 1 filter barang
    ///tahap ini memfilter barang berdasarkam input pengguna (TextField)
    if (keyword.isNotEmpty) {
      ///hanya mengembalikan data barang dengan bebearapa kondisi
      item = item.where((barang) {
        ///"barang.nmBarang" berdasarkan nama barang
        return barang.nmBarang.toLowerCase().contains(keyword) ||
            ///"barang.kategori!.kategori" berdasarkan kategori barang
            ///"barang.kategori!.kategori" -> AppBarang -> AppKategori == kategori
            barang.kategori!.kategori.toLowerCase().contains(keyword) ||
            ///"barang.jenis!.jenis" berdasarkan jenis barang
            ///"barang.jenis!.jenis" -> Appbarang -> AppJenis == jenis
            barang.jenis!.jenis.toLowerCase().contains(keyword);
      }).toList();
    }

    ///tahap 2 filter barang
    ///tahap ini memfilter barang berdasarkan pilihan pengguna (CustomFilterChips)
    if (select != 0) {
      ///hanya mengembalikan data barang dengan 1 kondisi (by id_kategori)
      item = item.where((barang) {
        return barang.kategoriId == select;
      }).toList();
    }

    ///update state hasil filter
    ///"filterBarang" akan mengisi data yang sudah difilter ".assignAll(item)"
    filterBarang.assignAll(item);
  }

  ///funsgi untuk stop filter pencarian by input (TextField)
  void filterData(String query) {
    ///_debounce?.isActive ?? false maksudnya
    ///Kalau _debounce ada dan aktif -> true
    ///Kalau _debounce ada tapi sudah selesai -> false
    ///Kalau _debounce masih null (belum pernah dibuat) -> false
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    ///bikin timer baru yang jalan sekali abis 300ms
    _debounce = Timer(Duration(milliseconds: 300), () {
      ///kalau 300ms lewat combineFilter(); bakal dieksekusi
      combineFilter();
    });
  }
}
