import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inven/app/global/widgets/CustomAppBar.dart';
import 'package:inven/app/global/widgets/CustomBtnForm.dart';
import 'package:inven/app/global/widgets/CustomShowDialog.dart';

import 'package:inven/app/modules/staff/controllers/staff_controller.dart';
import 'package:inven/app/modules/staff/views/pengajuan/staff_ajukan_panel.dart';
import 'package:inven/app/modules/staff/views/pengajuan_panel/confirm_panel.dart';

class StaffAjukanView extends GetView<StaffController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppbar(
          title: 'Pengajuan',
          boldTitle: 'Peminjaman',
          showNotif: false,
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: StaffAjukanPanel(),
          ),
        ),

        Obx(() {
          return Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
            child: CustomBtnForm(
              label: 'kirim',
              isLoading: controller.isBtnLoad.value,
              OnPress: () {
                Get.dialog(
                  CustomShowDialog(child: ConfirmPanel())
                );
              },
            ),
          );
        }),
      ],
    );
  }
}
