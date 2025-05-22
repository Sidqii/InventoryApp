import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/module/controller/ctrl_panel.dart';
import 'package:pusdatin_end/utils/validator.dart';
import 'package:pusdatin_end/widget/customtxtfield.dart';

class PanelTanggal extends StatelessWidget {
  final Function()? onSubmit;

  const PanelTanggal({
    this.onSubmit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final panelctrl = Get.find<CtrlPanel>();

    return CustomTxtField(
      controller: panelctrl.tanggalCtrl,
      label: 'Tanggal pengembalian',
      validator: dateValidator,
      keyboardtype: TextInputType.datetime,
      obscuretxt: false,
      focusnode: panelctrl.tanggalFcs,
      onfieldsubmitted: (_) => onSubmit?.call(),
    );
  }
}
