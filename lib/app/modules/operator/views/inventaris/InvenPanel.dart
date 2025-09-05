import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/global/controllers/global_inven_controller.dart';
import 'package:inven/app/global/widgets/CustomFilterChips.dart';
import 'package:inven/app/global/widgets/CustomTxtForm.dart';
import 'package:inven/app/modules/operator/views/inventaris/InvenBody.dart';

class InvenPanel extends GetView<GlobalInvenController> {
  const InvenPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTxtForm(
            Label: 'Cari barang',
            Controller: controller.ctrlFilter,
            Focus: controller.fcsFilter,
            OnSubmit: (val) {
              controller.filterData(val!);
            },
            OnChange: (val) {
              controller.filterData(val!);
            },
          ),

          const SizedBox(height: 15),

          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomFilterChips(
                    opsi: controller.opsiFilter.value,
                    select: controller.selectOpsi.value,
                    isSelect: (val) {
                      controller.selectOpsi.value = val;
                      controller.combineFilter();
                    },
                  ),
                ),

                IconButton(
                  onPressed: () {
                    controller.refresh();
                  },
                  icon: Icon(Icons.refresh),
                ),
              ],
            );
          }),

          const SizedBox(height: 15),

          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.separated(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: controller.filterBarang.length,
                separatorBuilder: (context, index) {
                  return const SizedBox();
                },
                itemBuilder: (context, index) {
                  final item = controller.filterBarang[index];

                  return InvenBody(model: item);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
