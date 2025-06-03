import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/ctrl_panel.dart';
import 'package:pusdatin_end/widget/customtxtfield.dart';

class PanelInstansi extends StatelessWidget {
  const PanelInstansi({super.key});

  @override
  Widget build(BuildContext context) {
    final panelctrl = Get.find<CtrlPanel>();

    return CustomTxtField(
      controller: panelctrl.instansiCtrl,
      label: 'Instansi',
      validator: null,
      keyboardtype: TextInputType.text,
      obscuretxt: false,
      focusnode: panelctrl.instansiFcs,
      onfieldsubmitted: (_) {
        FocusScope.of(context).requestFocus(panelctrl.halFcs);
      },
    );
  }
}
