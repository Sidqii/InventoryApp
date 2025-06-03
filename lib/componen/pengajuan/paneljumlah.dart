import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/ctrl_panel.dart';
import 'package:pusdatin_end/widget/customtxtfield.dart';

class PanelJumlah extends StatelessWidget {
  const PanelJumlah({super.key});

  @override
  Widget build(BuildContext context) {
    final panelctrl = Get.find<CtrlPanel>();

    return Obx(() {
      final stokItem = panelctrl.stok.value;
      final selectedItem = panelctrl.selectedItemId?.value;

      return CustomTxtField(
        controller: panelctrl.jumlahCtrl,
        label: selectedItem != null && selectedItem > 0
            ? 'Jumlah maksimal $stokItem'
            : 'Jumlah',
        validator: (val) {
          final jumlah = int.tryParse(val ?? '');
          if (jumlah == null) {
            return null;
          }
          if (jumlah > stokItem) {
            return 'Stok kurang';
          }
          return null;
        },
        keyboardtype: const TextInputType.numberWithOptions(decimal: false),
        obscuretxt: false,
        focusnode: panelctrl.jumlaFcs,
        onfieldsubmitted: (_) {
          FocusScope.of(context).requestFocus(panelctrl.tanggalFcs);
        },
      );
    });
  }
}
