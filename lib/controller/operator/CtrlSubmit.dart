import 'package:get/get.dart';
import 'package:pusdatin_end/model/app_unit_detail.dart';
import 'package:pusdatin_end/services/operator/ServicesSubmit.dart';

class CtrlSubmit extends GetxController {
  final isloading = false.obs;
  final services = ServicesSubmit();

  final items = <AppUnitDetailModel>[].obs;
  final selectAll = true.obs;

  int get selectCount {
    int count = 0;
    for (final AppUnitDetailModel item in items) {
      if (item.selected) {
        count = count + 1;
      }
    }
    return count;
  }

  void setItems(List<AppUnitDetailModel> data) {
    items.clear();

    for (final AppUnitDetailModel it in data) {
      it.selected = true;
      items.add(it);
    }

    selectAll.value = true;
    items.refresh();
  }

  void selectAllItem(bool value) {
    selectAll.value = value;
    for (final AppUnitDetailModel item in items) {
      item.selected = value;
    }
    items.refresh();
  }

  void selectItem(int index, bool value) {
    items[index].selected = value;

    if (!value) {
      selectAll.value = false;
    } else {
      bool allSelect = true;

      for (final AppUnitDetailModel item in items) {
        if (!item.selected) {
          allSelect = false;
          break;
        }
      }
      selectAll.value = allSelect;
    }
    items.refresh();
  }

  Future<bool> updateunit(
    int perubahan,
    int sttsunit,
    int userid,
    int unitid,
    String? note, {
    bool show = true,
    bool load = true,
  }) async {
    try {
      if (load) {
        isloading.value = true;
      }

      final revoke = await services.revoke(
        perubahan,
        sttsunit,
        userid,
        unitid,
        note ?? '',
      );

      final bool ok = revoke == 200;

      if (show) {
        if (ok) {
          Get.snackbar('Sukses', 'Berhasil update pengembalian');
        } else {
          Get.snackbar('Gagal', 'Gagal update pengembalian');
        }
      }

      return ok;
    } catch (e) {
      if (show) {
        Get.snackbar('Erro', 'Terjadi kesalahan');
      }
      return false;
    } finally {
      if (load) {
        isloading.value = false;
      }
    }
  }

  Future<void> updateAllUnit(
    int perubahan,
    int sttsunit,
    int userid,
    String? note,
  ) async {
    try {
      isloading.value = true;

      int totalSlct = 0;
      int sccs = 0;
      int fail = 0;

      for (final AppUnitDetailModel item in items) {
        if (item.selected) {
          totalSlct = totalSlct + 1;

          final bool ok = await updateunit(
            perubahan,
            sttsunit,
            userid,
            item.unitmodel.id,
            note,
            show: false,
            load: false,
          );

          if (ok) {
            sccs = sccs + 1;
          } else {
            fail = fail + 1;
          }
        }
      }
      if (totalSlct == 0) {
        Get.snackbar('Info', 'Tidak ada barang dipilih');
      } else if (fail == 0) {
        Get.snackbar('Sukses', 'Semua ($sccs) barang berhasil diproses');
      } else if (sccs == 0) {
        Get.snackbar('Gagal', 'Semua ($fail) barang gagal diproses');
      } else {
        Get.snackbar('Selesai sebagian', '$sccs Sukses, $fail Gagal');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan');
    } finally {
      isloading.value = false;
    }
  }
}
