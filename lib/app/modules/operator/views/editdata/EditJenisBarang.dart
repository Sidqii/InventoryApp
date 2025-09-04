import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/data/models/AppJenis.dart';
import 'package:inven/app/modules/operator/controllers/operator_edit_controller.dart';

class EditJenisBarang extends GetView<OperatorEditController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final daftar = controller.listJenis;

      return DropdownSearch<AppJenis>(
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            labelText: 'Jenis barang',
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: UnderlineInputBorder(),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ), // underline hitam saat fokus
            ),
          ),
        ),
        items: daftar,
        itemAsString: (item) => item.jenis,
        selectedItem: daftar.firstWhereOrNull(
          (f) => f.id == controller.ctrlJenis.value,
        ),
        popupProps: PopupProps.menu(
          itemBuilder: (context, item, isSlct) {
            return ListTile(
              visualDensity: VisualDensity.compact,
              dense: true,
              title: Text(item.jenis, style: TextStyle(fontSize: 12)),
            );
          },
        ),
        dropdownBuilder: (context, slctItem) {
          return Text(
            slctItem?.jenis ?? '...',
            style: TextStyle(fontSize: 12),
          );
        },
        onChanged: (val) {
          if (val != null) controller.ctrlJenis.value = val.id;
        },
      );
    });
  }
}
