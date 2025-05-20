import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/module/controller/ctrl_persetujuan.dart';
import 'package:pusdatin_end/page/main/componen/historycardbody.dart';
import 'package:pusdatin_end/page/main/componen/historycardheader.dart';
import 'package:pusdatin_end/page/main/componen/historycardpanel.dart';
import 'package:pusdatin_end/widget/customfilterchips.dart';

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
    String selectedFilter = 'Semua';
    final List<String> filterOptions = [
      'Semua',
      'Menunggu',
      'Disetujui',
      'Ditolak',
    ];

    return Obx(() {
      final isExpanded = ctrlpersetujuan.expandedId.value == idItem;

      return Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 15,
              spreadRadius: 1,
              offset: const Offset(4, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Riwayat Pengajuan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 15),
            CustomFilterChips(
              options: filterOptions,
              selected: selectedFilter,
              onSelected: (val) {},
            ),
            const SizedBox(height: 15),
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
                  idPengajuan: int.tryParse(item['id'].toString()) ?? 0,
                ),
            ]
          ],
        ),
      );
    });
  }
}
