import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/common/CtrlRiwayat.dart';
import 'package:pusdatin_end/interface/staff/formriwayat/FormCardPanelStaff.dart';
import 'package:pusdatin_end/widget/customfilterchips.dart';
import 'package:pusdatin_end/widget/panelBackground.dart';

class StaffPanel extends StatelessWidget {
  const StaffPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlRiwayat>();
    final RxInt selectedFilter = 1.obs;
    final Map<int, String> filterOptions = {
      0: '|||',
      1: 'Menunggu',
      2: 'Disetujui',
      3: 'Ditolak',
      5: 'Selesai'
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BackgroundPanel(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Riwayat Pengajuan',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await ctrl.refresh();
                    },
                    icon: Icon(Icons.refresh),
                  ),
                ],
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
                if (ctrl.isloading.value == true) {
                  return Container(
                    height: 143,
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 120,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xffF4F7F7),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return FormcardPanelStaff(
                    slcfltr: selectedFilter.value,
                  );
                }
              }),
            ],
          ),
        ),
      ],
    );
  }
}
