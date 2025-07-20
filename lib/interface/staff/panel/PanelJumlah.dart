import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/staff/CtrlPengajuan.dart';
import 'package:pusdatin_end/widget/customtxtfield.dart';

class PanelJumlah extends StatelessWidget {
  const PanelJumlah({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlPengajuan>();

    return Obx(() {
      final stok = ctrl.stkitem.value;
      final slct = ctrl.slcitem.value;

      return CustomTxtField(
        controller: ctrl.ctrljumlah,
        label: slct != null && slct > 0
            ? 'Jumlah maks $stok'
            : 'Jumlah',
        validator: (val) {
          final jumlah = int.tryParse(val ?? '');
          if (jumlah == null) {
            return null;
          }
          if (jumlah > stok) {
            return 'Stok kurang';
          }
          return null;
        },
        keyboardtype: const TextInputType.numberWithOptions(decimal: false),
        focusnode: ctrl.fcsjumlah,
        onfieldsubmitted: (_) {},
      );
    });
  }
}
