import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/module/controller/ctrl_persetujuan.dart';
import 'package:pusdatin_end/page/main/componen/historycardbody.dart';
import 'package:pusdatin_end/page/main/componen/historycardheader.dart';
import 'package:pusdatin_end/page/main/componen/historycardpanel.dart';

class HistoryCardItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final String roleuser;

  const HistoryCardItem({
    required this.item,
    required this.roleuser,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ctrlpersetujuan = Get.find<CtrlPersetujuan>();

    final idItem = item['id'].toString();
    return Obx(() {
      final isExpanded = ctrlpersetujuan.expandedId.value == idItem;

      return Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        // height: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HistoryCardHeader(
              item: item,
              isExpanded: isExpanded,
              onBtnExpand: () {
                ctrlpersetujuan.expandedId.value = isExpanded ? '' : idItem;
              },
            ),
            if (isExpanded) ...[
              const SizedBox(height: 12),
              HistoryCardBody(item: item),
              if (roleuser == 1) HistorCardPanel(idPengajuan: item['id'])
            ]
          ],
        ),
      );
    });
  }
}
