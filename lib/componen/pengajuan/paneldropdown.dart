import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/ctrl_pengajuan.dart';
import 'package:pusdatin_end/dataset/model/inventaris.dart';

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
            (item) => item.namaBarang == val,
            orElse: () => InvenModels(
              id: 0,
              namaBarang: '',
              kategori: '',
              harga: 0,
              stok: 0,
              namaLokasi: '',
              status: '',
              tglDibuat: '',
            ),
          );
          ctrl.selectedName.value = val;
          ctrl.selectedItem.value = selected.id;
          ctrl.stokItem.value = selected.stok;
        },
        dropdownMenuEntries: barang
            .where((item) => item.stok > 0)
            .map((item) => DropdownMenuEntry(
                  value: item.namaBarang,
                  label: item.namaBarang,
                ))
            .toList(),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          border: UnderlineInputBorder(),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            )
          ),
        ),
      );
    });
  }
}
