import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:inven/app/data/models/AppPengajuan.dart';
import 'package:inven/app/modules/staff/controllers/staff_controller.dart';
import 'package:inven/app/modules/staff/views/riwayat/RiwayatData.dart';
import 'package:inven/app/modules/staff/views/riwayat/RiwayatTable.dart';

class RiwayatBody extends GetView<StaffController> {
  final AppPengajuan model;

  const RiwayatBody({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    final id = model.id.toString();

    return Obx(() {
      final isExpand = controller.expandR.value == id;

      return Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xffF4F7F7),
                borderRadius: BorderRadius.circular(5),
              ),
              child: RiwayatData(
                idItem: model.id,
                expand: isExpand,
                model: model,
                bttn: () {
                  controller.expandR.value = isExpand ? '' : id;
                },
              ),
            ),

            if (isExpand) ...[
              const SizedBox(height: 10),

              RiwayatTable(model: model),
            ],
          ],
        ),
      );
    });
  }
}
