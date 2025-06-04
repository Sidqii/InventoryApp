import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/ctrl_pengajuan.dart';
import 'package:pusdatin_end/widget/customtxtfield.dart';

class PanelJumlah extends StatelessWidget {
  const PanelJumlah({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlPengajuan>();

    return Obx(() {
      final stokItem = ctrl.stokItem.value;
      final selectedItem = ctrl.selectedItem.value;

      return CustomTxtField(
        controller: ctrl.jumlahctrl,
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
        focusnode: ctrl.jumlahfocus,
        onfieldsubmitted: (_) {
          FocusScope.of(context).requestFocus(ctrl.tglfocus);
        },
      );
    });
  }
}
