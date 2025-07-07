import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:pusdatin_end/componen/inventaris/invencard.dart';
import 'package:pusdatin_end/controller/ctrl_inventaris.dart';
import 'package:pusdatin_end/widget/customfilterchips.dart';
import 'package:pusdatin_end/widget/customtxtfield.dart';

class Invenpanel extends StatelessWidget {
  const Invenpanel({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlInventaris>();
    // final RxInt pilihfilter = 0.obs;
    final Map<int, String> opsifilter = {
      0: '|||',
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
                  options: opsifilter,
                  selected: ctrl.filterchips.value,
                  onSelected: (val) {
                    ctrl.filterchips.value = val;
                    ctrl.combineFilter();
                  },
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
                  return Invencard(model: item,);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
