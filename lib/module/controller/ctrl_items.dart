import 'package:get/get.dart';
import 'package:pusdatin_end/module/services/services_items.dart';
import 'package:pusdatin_end/widget/customdialog.dart';

class CtrlItems extends GetxController {
  final ServicesItems services = ServicesItems();
  var filterItem = <dynamic>[].obs;
  var items = <dynamic>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      isLoading(true);
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
      isLoading(false);
    }
  }

  void filterData(String query) {
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
            item['status'].toString().toLowerCase().contains(lowerQuery);
      }).toList();
      filterItem.assignAll(filterList);
    }
  }

  void filterByCategory(String category) {
    if (category == 'Semua') {
      filterItem.assignAll(List.from(items));
    } else {
      List<dynamic> filtered = [];
      for (var item in items) {
        if (item['nama_kategori'].toString().toLowerCase() == category.toLowerCase()) {
          filtered.add(item);
        }
      }
      filterItem.assignAll(filtered);
    }
  }
}
