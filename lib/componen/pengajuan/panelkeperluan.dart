import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/ctrl_panel.dart';
import 'package:pusdatin_end/widget/customtxtfield.dart';

class PanelKeperluan extends StatelessWidget {
  const PanelKeperluan({super.key});

  @override
  Widget build(BuildContext context) {
    final panelctrl = Get.find<CtrlPanel>();

    return CustomTxtField(
      controller: panelctrl.halCtrl,
      label: 'Hal',
      validator: null,
      keyboardtype: TextInputType.text,
      obscuretxt: false,
      focusnode: panelctrl.halFcs,
      onfieldsubmitted: (_) {
      },
    );
  }
}
