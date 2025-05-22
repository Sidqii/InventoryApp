import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/module/controller/ctrl_panel.dart';

class PanelDropdown extends StatelessWidget {
  const PanelDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final panelctrl = Get.find<CtrlPanel>();

    return Obx(() {
      final barang = panelctrl.daftarBarang;
      final selectedItem = panelctrl.selectedItemName?.value;

      return DropdownMenu<String>(
        key: ValueKey(selectedItem),
        hintText: 'Pilih barang',
        initialSelection: selectedItem,
        width: MediaQuery.sizeOf(context).width * 0.48,
        textStyle: const TextStyle(fontSize: 14),
        onSelected: (val) {
          if (val == null) {
            return;
          }

          final selected = barang.firstWhere(
            (item) => item['nama_barang'] == val,
            orElse: () => {},
          );

          panelctrl.selectedItemName = val.obs;
          panelctrl.selectedItemId = RxInt(
            int.tryParse(selected['id'].toString()) ?? 0,
          );
          panelctrl.stok.value = int.tryParse(selected['stok'].toString()) ?? 0;
        },
        dropdownMenuEntries: barang.where((item) {
          final stok = int.tryParse(item['stok'].toString()) ?? 0;
          return stok > 0;
        }).map((item) {
          return DropdownMenuEntry<String>(
            value: item['nama_barang'],
            label: item['nama_barang'],
          );
        }).toList(),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          border: UnderlineInputBorder(),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
        ),
      );
    });
  }
}
