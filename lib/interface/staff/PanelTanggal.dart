import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/staff/CtrlPengajuan.dart';
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
    final ctrl = Get.find<CtrlPengajuan>();

    return CustomTxtField(
      controller: ctrl.tglcontrol,
      label: 'Tanggal pengembalian',
      validator: dateValidator,
      keyboardtype: TextInputType.datetime,
      focusnode: ctrl.tglfocus,
      onfieldsubmitted: (_) {
        if (!ctrl.isLoading.value) {
          onSubmit?.call();
        }
      },
    );
  }
}
