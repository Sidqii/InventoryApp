import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/module/controller/ctrl_persetujuan.dart';
import 'package:pusdatin_end/page/main/componen/riwayat/historycardbody.dart';
import 'package:pusdatin_end/page/main/componen/riwayat/historycardheader.dart';
import 'package:pusdatin_end/page/main/componen/riwayat/historycardpanel.dart';

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
      final pengajuan = int.tryParse(item['id'].toString()) ?? 0;

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
              child: HistoryCardHeader(
                item: item,
                isExpanded: isExpanded,
                onBtnExpand: () {
                  ctrlpersetujuan.expandedId.value = isExpanded ? '' : idItem;
                },
              ),
            ),
            if (isExpanded) ...[
              const SizedBox(height: 12),
              HistoryCardBody(item: item),
              const SizedBox(height: 10),
              if (roleuser == 'Operator')
                HistorCardPanel(
                  idPengajuan: pengajuan,
                ),
            ]
          ],
        ),
      );
    });
  }
}
