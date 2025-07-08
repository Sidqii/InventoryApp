import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/staff/CtrlPengajuan.dart';
import 'package:pusdatin_end/dataset/model/app_barang.dart';
import 'package:pusdatin_end/dataset/model/app_jenis.dart';
import 'package:pusdatin_end/dataset/model/app_kategori.dart';

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
            orElse: () => AppBarangModel(
              id: 0,
              barang: '',
              kode: '',
              merk: '',
              deskripsi: '',
              spesifikasi: {},
              pengadaan: '',
              garansi: 0,
              sumber: '',
              vendor: '',
              total: 0,
              note: '',
              createdAt: '',
              updatedAt: '',
              kategori: AppKategoriModel(
                id: 0,
                kategori: '',
              ),
              jenis: AppJenisModel(
                id: 0,
                jenis: '',
              ),
            ),
          );
          ctrl.selectedName.value = val;
          ctrl.selectedItem.value = selected.id;
          ctrl.stokItem.value = selected.total;
        },
        dropdownMenuEntries: barang
            .where((item) => item.total > 0)
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
