import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/componen/card/formcardpanel.dart';
import 'package:pusdatin_end/controller/ctrl_persetujuan.dart';
import 'package:pusdatin_end/widget/customfilterchips.dart';
import 'package:pusdatin_end/widget/custompanel.dart';

class Role1Panel extends StatelessWidget {
  const Role1Panel({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlPersetujuan>();

    final RxInt selectedFilter = 1.obs;
    final Map<int, String> filterOptions = {
      0: 'Semua',
      1: 'Menunggu',
      2: 'Disetujui',
      3: 'Ditolak',
    };

    return CustomPanel(
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
                  child: FormCardPanel(selectedFilter: selectedFilter.value),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
