import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/staff/CtrlPengajuan.dart';
import 'package:pusdatin_end/widget/customtxtfield.dart';

class PanelKeperluan extends StatelessWidget {
  const PanelKeperluan({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlPengajuan>();

    return CustomTxtField(
      controller: ctrl.ctrlhal,
      label: 'Hal',
      validator: null,
      keyboardtype: TextInputType.text,
      focusnode: ctrl.fcshal,
      onfieldsubmitted: (_) {
      },
    );
  }
}
