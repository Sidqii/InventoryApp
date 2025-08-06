import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/model/app_barang.dart';
import 'package:pusdatin_end/services/common/ServicesInven.dart';
import 'package:pusdatin_end/widget/customdialog.dart';

class CtrlInvenStaff extends GetxController {
  final services = ServicesInven();

  final filterctrl = TextEditingController();
  final filterfocus = FocusNode();
  final filterchips = 0.obs;

  var filterItem = <AppBarangModel>[].obs;
  var items = <AppBarangModel>[].obs;
  var isLoading = false.obs;

  Timer? _debounce;
  bool _hasFetched = false;

  @override
  void onInit() {
    super.onInit();
    Future.microtask(() async {
      if (!_hasFetched) {
        await fetchData();
        _hasFetched = true;
      }
    });
  }

  @override
  void dispose() {
    filterctrl.dispose();
    filterfocus.dispose();
    super.dispose();
  }

  Future<void> refreshed() async {
    isLoading.value = true;

    await Future.delayed(
      Duration(seconds: 1),
    );

    await fetchData(isrefreshed: true);

    await Future.delayed(
      Duration(seconds: 2),
    );

    isLoading.value = false;
  }

  Future<void> fetchData({bool isrefreshed = false}) async {
    if (items.isNotEmpty && !isrefreshed) return;

    try {
      isLoading.value = true;

      List<AppBarangModel> parsed = await services.GetUnit();

      items.assignAll(parsed);
      filterItem.assignAll(parsed);
    } catch (e) {
      CustomDialog.show(
        isSuccess: false,
        duration: Duration(seconds: 3),
      );
    } finally {
      isLoading.value = false;
    }
  }

  void combineFilter() {
    String keyword = filterctrl.text.toLowerCase();
    int selected = filterchips.value;

    List<AppBarangModel> result = items;

    if (keyword.isNotEmpty) {
      result = result.where((item) {
        return item.barang.toLowerCase().contains(keyword) ||
            item.kategori.kategori.toLowerCase().contains(keyword) ||
            item.total.toString().contains(keyword);
      }).toList();
    }

    if (selected != 0) {
      result = result.where((item) {
        return item.kategori.id == selected;
      }).toList();
    }

    filterItem.assignAll(result);
  }

  void filterData(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: 300), () {
      combineFilter();
    });
  }
}
