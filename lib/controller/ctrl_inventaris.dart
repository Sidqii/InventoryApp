import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/dataset/model/inventaris.dart';
import 'package:pusdatin_end/services/services_items.dart';
import 'package:pusdatin_end/widget/customdialog.dart';

class CtrlInventaris extends GetxController {
  final services = ServicesItems();

  final filterctrl = TextEditingController();
  final filterfocus = FocusNode();

  var filterItem = <InvenModels>[].obs;
  var items = <InvenModels>[].obs;
  var isLoading = false.obs;

  Timer? _debounce;
  bool _hasFetched = false;

  @override
  void onInit() {
    super.onInit();
    if (!_hasFetched) {
      fetchData();
      _hasFetched = true;
    }
  }

  @override
  void dispose() {
    filterctrl.dispose();
    filterfocus.dispose();
    super.dispose();
  }

  void refreshed() {
    fetchData();
  }

  List<InvenModels> parseList(dynamic dbList) {
    List<InvenModels> parsedList = [];
    if (dbList is List) {
      for (var item in dbList) {
        InvenModels models = InvenModels.fromJson(item);
        parsedList.add(models);
      }
    }
    return parsedList;
  }

  Future<void> fetchData() async {
    if (items.isNotEmpty) return;
    try {
      isLoading.value = true;
      var data = await services.getItems();
      if (data.isNotEmpty) {
        items.assignAll(parseList(data));
        filterItem.assignAll(parseList(data));
      }
    } catch (e) {
      CustomDialog.show(
        isSuccess: false,
        title: 'Error',
        duration: Duration(seconds: 5),
      );
    } finally {
      isLoading.value = false;
    }
  }

  void filterData(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: 300), () {
      if (query.trim().isEmpty) {
        filterItem.assignAll(List.from(items));
      } else {
        var lowerQuery = query.toLowerCase();
        var filterList = items.where((item) {
          return item.namaBarang
                  .toString()
                  .toLowerCase()
                  .contains(lowerQuery) ||
              item.kategori.toString().toLowerCase().contains(lowerQuery) ||
              item.stok.toString().toLowerCase().contains(lowerQuery) ||
              item.namaLokasi.toString().toLowerCase().contains(lowerQuery) ||
              item.status.toString().toLowerCase().contains(lowerQuery);
        }).toList();
        filterItem.assignAll(filterList);
      }
    });
  }

  void filterByCategory(String category) {
    if (category == 'Semua') {
      filterItem.assignAll(List.from(items));
    } else {
      final filtered = items
          .where((item) =>
              item.kategori.toString().toLowerCase() == category.toLowerCase())
          .toList();
      filterItem.assignAll(filtered);
    }
  }
}
