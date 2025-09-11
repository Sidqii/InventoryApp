import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/data/models/AppPengajuan.dart';
import 'package:inven/app/modules/operator/controllers/operator_controller.dart';
import 'package:inven/app/modules/operator/views/persetujuan/PersetujuanData.dart';
import 'package:inven/app/modules/staff/views/riwayat/RiwayatTable.dart';

class PersetujuanBody extends GetView<OperatorController> {
  final AppPengajuan model;

  const PersetujuanBody({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    final id = model.id.toString();

    return Obx(() {
      final isExpanded = controller.isExpand.value == id;

      return Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xffF4F7F7),
                borderRadius: BorderRadius.circular(5),
              ),
              child: PersetujuanData(
                itemId: model.id,
                expand: isExpanded,
                model: model,
                bttn: () {
                  controller.isExpand.value = isExpanded ? '' : id;
                },
              ),
            ),

            if (isExpanded) ...[
              const SizedBox(height: 10),

              RiwayatTable(model: model),
            ],
          ],
        ),
      );
    });
  }
}
