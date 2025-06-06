import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/componen/riwayat/formhistorylogic.dart';
import 'package:pusdatin_end/controller/ctrl_persetujuan.dart';
import 'package:pusdatin_end/widget/customappbar.dart';
import 'package:pusdatin_end/widget/customfilterchips.dart';
import 'package:pusdatin_end/widget/custompanel.dart';

class InterfaceRiwayat extends StatelessWidget {
  const InterfaceRiwayat({super.key});

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

    return Scaffold(
      appBar: CustomAppbar(
        title: 'Pengajuan',
        boldTitle: 'Barang',
        showNotif: true,
      ),
      body: CustomPanel(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Expanded(
              child: Obx(() {
                if (ctrl.isLoading.value == true) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return SingleChildScrollView(
                    child: formHistoryLogic(
                      selectedFilter: selectedFilter.value,
                    ),
                  );
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}
