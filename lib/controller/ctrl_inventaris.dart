import 'dart:async';
import 'package:get/get.dart';
import 'package:pusdatin_end/dataset/model/item.dart';
import 'package:pusdatin_end/services/services_items.dart';
import 'package:pusdatin_end/widget/customdialog.dart';

class CtrlItems extends GetxController {
  final ServicesItems services = ServicesItems();
  var filterItem = <dynamic>[].obs;
  var items = <dynamic>[].obs;
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

  void refreshed() {
    fetchData();
  }

  List<ItemModels> parseList(dynamic dbList) {
    List<ItemModels> parsedList = [];
    if (dbList is List) {
      for (var item in dbList) {
        ItemModels models = ItemModels.fromJson(item);
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
        items.assignAll(data);
        filterItem.assignAll(data);
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
          return item['nama_barang']
                  .toString()
                  .toLowerCase()
                  .contains(lowerQuery) ||
              item['nama_kategori']
                  .toString()
                  .toLowerCase()
                  .contains(lowerQuery) ||
              item['stok'].toString().toLowerCase().contains(lowerQuery) ||
              item['nama_lokasi']
                  .toString()
                  .toLowerCase()
                  .contains(lowerQuery) ||
              item['status'].toString().toLowerCase().contains(lowerQuery);
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
              item['nama_kategori'].toString().toLowerCase() ==
              category.toLowerCase())
          .toList();
      filterItem.assignAll(filtered);
    }
  }
}
