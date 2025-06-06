import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/componen/riwayat/formhistorylogic.dart';
import 'package:pusdatin_end/controller/ctrl_persetujuan.dart';
import 'package:pusdatin_end/widget/customfilterchips.dart';
import 'package:pusdatin_end/widget/custompanel.dart';

class RiwayatPanel extends StatelessWidget {
  const RiwayatPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrlsetuju = Get.find<CtrlPersetujuan>();
    final RxString selectedFilter = 'Semua'.obs;
    final List<String> filterOptions = [
      'Semua',
      'Menunggu',
      'Disetujui',
      'Ditolak',
    ];

    return CustomPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Riwayat pengajuan',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 15),
          Obx(() {
            return CustomFilterChips(
              options: filterOptions,
              selected: selectedFilter.value,
              onSelected: (val) {
                selectedFilter.value = val;
              },
            );
          }),
          const SizedBox(height: 15),
          Obx(() {
            if (ctrlsetuju.isLoading.value == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return formHistoryLogic(
                selectedFilter: selectedFilter.value,
              );
            }
          })
        ],
      ),
    );
  }
}
