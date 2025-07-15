import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/staff/CtrlPengajuan.dart';
import 'package:pusdatin_end/widget/customtxtfield.dart';

class PanelInstansi extends StatelessWidget {
  const PanelInstansi({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlPengajuan>();

    return CustomTxtField(
      controller: ctrl.ctrlinstansi,
      label: 'Instansi',
      validator: null,
      keyboardtype: TextInputType.text,
      focusnode: ctrl.fcsinstansi,
      onfieldsubmitted: (_) {
        FocusScope.of(context).requestFocus(ctrl.fcshal);
      },
    );
  }
}
