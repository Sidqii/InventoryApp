import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/global/widgets/CustomDatePicker.dart';
import 'package:inven/app/modules/staff/controllers/staff_controller.dart';

class AjukanPinjam extends GetView<StaffController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CustomDatePicker(
        label: 'Tanggal peminjaman:',
        slctDate: controller.ctrlPinjam.value,
        onDatePick: (val) {
          controller.ctrlPinjam.value = val;
        },
      );
    });
  }
}
