import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/ctrl_pengajuan.dart';
import 'package:pusdatin_end/widget/customtxt.dart';

class PanelInstansi extends StatelessWidget {
  const PanelInstansi({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlPengajuan>();

    return Customtxt(
      controller: ctrl.instansictrl,
      label: 'Instansi',
      validator: null,
      keyboardtype: TextInputType.text,
      obscuretxt: false,
      focusnode: ctrl.instansifocus,
      onfieldsubmitted: (_) {
        FocusScope.of(context).requestFocus(ctrl.halfocus);
      },
    );
  }
}
