import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/ctrl_user.dart';
import 'package:pusdatin_end/dataset/model/inventaris.dart';
import 'package:pusdatin_end/services/services_inven.dart';
import 'package:pusdatin_end/widget/customdialog.dart';

class CtrlInventaris extends GetxController {
  final services = ServicesInven();

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
    await Future.delayed(Duration(seconds: 2));
    await fetchData(isrefreshed: true);
    await Future.delayed(Duration(seconds: 1));
    isLoading.value = false;
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

  Future<void> fetchData({bool isrefreshed = false}) async {
    if (items.isNotEmpty && !isrefreshed) return;

    try {
      isLoading.value = true;

      var data = await services.getItems();
      List<InvenModels> parsed = parseList(data);

      final i = Get.find<CtrlUser>().user.value!;
      final int role = i.role ?? 0;

      if (role == 2) {
        parsed = parsed.where((item) => item.stok > 0).toList();
      }

      if (data.isNotEmpty) {
        items.assignAll(parsed);
        filterItem.assignAll(parsed);
      }
    } catch (e) {
      CustomDialog.show(
        isSuccess: false,
        title: 'Error',
        duration: Duration(seconds: 3),
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
}
