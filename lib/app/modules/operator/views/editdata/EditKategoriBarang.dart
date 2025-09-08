import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/data/models/AppKategori.dart';
import 'package:inven/app/modules/operator/controllers/operator_edit_controller.dart';

class EditKategoriBarang extends GetView<OperatorEditController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final daftar = controller.listKategori;

      return DropdownSearch<AppKategori>(
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            labelText: 'Kategori barang',
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade900,
            ),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade900),
            ),
          ),
        ),
        items: daftar,
        itemAsString: (item) => item.kategori,
        selectedItem: daftar.firstWhereOrNull(
          (f) => f.id == controller.ctrlKategori.value,
        ),
        popupProps: PopupProps.menu(
          itemBuilder: (context, item, isSlct) {
            return ListTile(
              visualDensity: VisualDensity.compact,
              dense: true,
              title: Text(item.kategori, style: TextStyle(fontSize: 12)),
            );
          },
        ),
        dropdownBuilder: (context, slctItem) {
          return Text(
            slctItem?.kategori ?? '...',
            style: TextStyle(fontSize: 12),
          );
        },
        onChanged: (val) {
          if (val != null) controller.ctrlKategori.value = val.id;
        },
      );
    });
  }
}
