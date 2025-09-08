import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/data/models/AppBarang.dart';
import 'package:inven/app/modules/staff/controllers/staff_controller.dart';

class AjukanBarang extends GetView<StaffController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final daftar = controller.itemList;

      return DropdownSearch<AppBarang>(
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            isDense: true,
            hintText: 'Pilih barang',
            hintStyle: TextStyle(color: Colors.grey),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade900),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),

        items: daftar,

        itemAsString: (item) => item.nmBarang,

        selectedItem: daftar.firstWhereOrNull(
          (i) => i.id == controller.slctItemId.value,
        ),

        popupProps: PopupProps.menu(
          constraints: BoxConstraints(maxHeight: 200),
          itemBuilder: (context, item, isSelected) {
            return ListTile(
              dense: true,
              visualDensity: VisualDensity.compact,
              title: Text(item.nmBarang, style: TextStyle(fontSize: 12)),
            );
          },
        ),

        dropdownBuilder: (context, selectedItem) {
          return Text(
            selectedItem?.nmBarang ?? 'Pilih barang',
            style: TextStyle(fontSize: 12),
          );
        },

        onChanged: (val) {
          if (val != null) controller.slctItemId.value = val.id;
        },
      );
    });
  }
}
