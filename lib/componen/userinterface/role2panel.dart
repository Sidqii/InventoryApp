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

    final RxInt selectedFilter = 0.obs;
    final Map<int, String> filterOptions = {
      0: 'Semua',
      1: 'Menunggu',
      2: 'Disetujui',
      3: 'Ditolak',
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPanel(
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
                      await ctrl.refresehed();
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
                if (ctrl.isLoading.value == true) {
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
                            child: CircularProgressIndicator(color: Colors.white,),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return FormCardPanel(
                    selectedFilter: selectedFilter.value,
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
