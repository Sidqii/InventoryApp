import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/ctrl_pengajuan.dart';
import 'package:pusdatin_end/dataset/model/inven/inventaris.dart';

class PanelDropdown extends StatelessWidget {
  const PanelDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlPengajuan>();

    return Obx(() {
      final barang = ctrl.daftaritems;
      final selecteditem = ctrl.selectedName.value;

      return DropdownMenu(
        key: ValueKey(selecteditem),
        hintText: 'Pilih barang',
        initialSelection: selecteditem,
        width: MediaQuery.sizeOf(context).width * 0.48,
        textStyle: const TextStyle(fontSize: 14),
        onSelected: (val) {
          if (val == null) {
            return;
          }
          final selected = barang.firstWhere(
            (item) => item.barang == val,
            orElse: () => InvenModels(
              id: 0,
              stok:0,
              jumbaik: 0,
              jumrusak: 0,
              jumrawat: 0,
              jumpinjam: 0,
              barang: '',
              kategori: '',
              lokasi: '',
              seri: '',
              dibuat: '',
              pengadaan: '',
            ),
          );
          ctrl.selectedName.value = val;
          ctrl.selectedItem.value = selected.id;
          ctrl.stokItem.value = selected.stok;
        },
        dropdownMenuEntries: barang
            .where((item) => item.stok > 0)
            .map((item) => DropdownMenuEntry(
                  value: item.barang,
                  label: item.barang,
                ))
            .toList(),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          border: UnderlineInputBorder(),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black,
            width: 2,
          )),
        ),
      );
    });
  }
}
