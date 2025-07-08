import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:pusdatin_end/controller/common/CtrlInventaris.dart';
import 'package:pusdatin_end/interface/staff/InvenCardStaff.dart';
import 'package:pusdatin_end/widget/customfilterchips.dart';
import 'package:pusdatin_end/widget/customtxtfield.dart';

class InvenPanelStaff extends StatelessWidget {
  const InvenPanelStaff({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlInventaris>();
    final Map<int, String> all = {0: '|||'};
    final Map<int, String> opsifilter = {
      1: 'Drone',
      2: 'Server',
      3: 'Komunikasi',
      4: 'Pengawasan',
      5: 'Navigasi',
      6: 'Enkripsi',
    };

    return Container(
      padding: const EdgeInsets.only(top: 8, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTxtField(
            controller: ctrl.filterctrl,
            label: 'Cari barang',
            validator: null,
            keyboardtype: TextInputType.text,
            focusnode: ctrl.filterfocus,
            onfieldsubmitted: (val) {
              ctrl.filterData(val);
            },
            onchanged: (val) {
              ctrl.filterData(val);
            },
          ),
          const SizedBox(height: 10),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomFilterChips(
                  options: all,
                  selected: ctrl.filterchips.value,
                  onSelected: (val) {
                    ctrl.filterchips.value = val;
                    ctrl.combineFilter();
                  },
                ),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: CustomFilterChips(
                        options: opsifilter,
                        selected: ctrl.filterchips.value,
                        onSelected: (val) {
                          ctrl.filterchips.value = val;
                          ctrl.combineFilter();
                        },
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    ctrl.refreshed();
                  },
                  icon: Icon(Icons.refresh),
                ),
              ],
            );
          }),
          const SizedBox(height: 10),
          Expanded(
            child: Obx(() {
              if (ctrl.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.separated(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: ctrl.filterItem.length,
                separatorBuilder: (context, index) {
                  return const SizedBox();
                },
                itemBuilder: (context, index) {
                  final item = ctrl.filterItem[index];
                  return InvenCardStaff(
                    model: item,
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
