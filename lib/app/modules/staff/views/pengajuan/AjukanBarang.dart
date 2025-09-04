import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/modules/staff/controllers/staff_controller.dart';

class AjukanBarang extends GetView<StaffController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final daftar = controller.itemList;
      final pilih = controller.slctItemId.value;

      return DropdownSearch<int>(
        key: controller.dropitem,
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            hintText: 'Pilih barang',
            hintStyle: TextStyle(color: Colors.grey),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(10)
            ),
          ),
        ),
        items: daftar.map((f) => f.id).toList(),
        itemAsString: (item) {
          final found = daftar.firstWhereOrNull((f) {
            return f.id == item;
          });

          return found?.nmBarang ?? '-';
        },
        selectedItem: pilih == 0 ? null : pilih,
        popupProps: PopupProps.menu(
          showSearchBox: false,
          constraints: BoxConstraints(maxHeight: 250),
        ),
        onChanged: (val) {
          if (val != null) {
            controller.slctItemId.value = val;
          }
        },
      );
    });
  }
}
