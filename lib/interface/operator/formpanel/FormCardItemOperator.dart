import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/operator/CtrlPersetujuan.dart';
import 'package:pusdatin_end/interface/operator/formpanel/FormCardBodyOperator.dart';
import 'package:pusdatin_end/model/app_riwayat.dart';
import 'package:pusdatin_end/interface/operator/formpanel/FormCardHeaderOperator.dart';

class FormCardItemOperator extends StatelessWidget {
  final AppRiwayatModel item;

  const FormCardItemOperator({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlPersetujuan>();
    final idItem = item.id.toString();

    return Obx(() {
      final isExpanded = ctrl.expandedId.value == idItem;

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
              child: FormCardHeaderOperator(
                id: item.id,
                item: item,
                expand: isExpanded,
                btn: () {
                  ctrl.expandedId.value = isExpanded ? '' : idItem;
                },
              ),
            ),
            if (isExpanded) ...[
              const SizedBox(height: 12),
              FormCardBodyOperator(item: item),
            ]
          ],
        ),
      );
    });
  }
}
