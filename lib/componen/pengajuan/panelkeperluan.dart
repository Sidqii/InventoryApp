import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/ctrl_pengajuan.dart';
import 'package:pusdatin_end/widget/customtxtfield.dart';

class PanelKeperluan extends StatelessWidget {
  const PanelKeperluan({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlPengajuan>();

    return CustomTxtField(
      controller: ctrl.halcontrol,
      label: 'Hal',
      validator: null,
      keyboardtype: TextInputType.text,
      obscuretxt: false,
      focusnode: ctrl.halfocus,
      onfieldsubmitted: (_) {
      },
    );
  }
}
