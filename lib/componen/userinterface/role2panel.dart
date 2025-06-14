import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/componen/card/formcardpanel.dart';
import 'package:pusdatin_end/controller/ctrl_persetujuan.dart';
import 'package:pusdatin_end/widget/customfilterchips.dart';
import 'package:pusdatin_end/widget/custompanel.dart';

class Role2Panel extends StatelessWidget {
  const Role2Panel({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlPersetujuan>();

    final RxString selectedFilter = 'Semua'.obs;
    final List<String> filterOptions = [
      'Semua',
      'Menunggu',
      'Disetujui',
      'Ditolak',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPanel(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Riwyat Pengajuan',
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
                if (ctrl.isLoading.value == true) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return FormCardPanel(selectedFilter: selectedFilter.value);
                }
              }),
            ],
          ),
        ),
      ],
    );
  }
}
