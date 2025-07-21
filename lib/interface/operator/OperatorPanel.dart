import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/common/CtrlRiwayat.dart';
import 'package:pusdatin_end/interface/operator/formpanel/FormCardPanelOperator.dart';
import 'package:pusdatin_end/widget/customfilterchips.dart';

class OperatorPanel extends StatelessWidget {
  const OperatorPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlRiwayat>();

    final RxInt selectedFilter = 1.obs;
    final Map<int, String> filterOptions = {
      0: '|||',
      1: 'Menunggu',
      2: 'Disetujui',
      3: 'Ditolak',
    };

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 10,
        right: 20,
        left: 20,
        bottom: 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomFilterChips(
                  options: filterOptions,
                  selected: selectedFilter.value,
                  onSelected: (val) {
                    selectedFilter.value = val;
                  },
                ),
                IconButton(
                  onPressed: () {
                    ctrl.refresh();
                  },
                  icon: Icon(
                    Icons.refresh,
                  ),
                ),
              ],
            );
          }),
          const SizedBox(height: 15),
          Expanded(
            child: Obx(() {
              if (ctrl.isloading.value == true) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    scrollbars: false,
                  ),
                  child: SingleChildScrollView(
                    child: FormCardPanelOperator(
                      selectedFilter: selectedFilter.value,
                    ),
                  ),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
