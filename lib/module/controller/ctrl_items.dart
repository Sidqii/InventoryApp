import 'package:get/get.dart';
import 'package:pusdatin_end/module/service/services_items.dart';
import 'package:pusdatin_end/widget/customdialog.dart';

class CtrlItems extends GetxController {
  var items = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;
  var page = 1.obs;
  final int itemsPerPage = 10;
  var hashMoreData = true.obs;

  @override
  void onInit() {
    fetchItems();
    super.onInit();
  }

  void fetchItems() async {
    if (isLoading.value || !hashMoreData.value) return;
    isLoading.value = true;

    try {
      var data = await ServicesItems().getItems(page.value, itemsPerPage);
      if (data.isNotEmpty) {
        items.addAll(data);
        page.value++;
      } else {
        hashMoreData.value = false;
      }
    } catch (e) {
      CustomDialog.show(
        isSuccess: false,
        message: 'Koneksi gagal',
      );
    }
    isLoading.value = false;
  }
}
