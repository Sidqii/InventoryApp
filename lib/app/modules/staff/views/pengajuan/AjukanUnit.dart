import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/modules/staff/controllers/staff_controller.dart';

class AjukanUnit extends GetView<StaffController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => CheckboxListTile(
            title: const Text('Semua'),
            value: controller.isCheckAll.value,
            onChanged: (value) {
              controller.chekAll(value ?? false);
            },
          ),
        ),

        Expanded(
          child: Obx(() {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }

            final unit = controller.unitFilt.isEmpty
                ? controller.unitList
                : controller.unitFilt;

            if (unit.isEmpty) {
              return Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  'Tidak ada unit tersedia',
                  style: TextStyle(color: Colors.grey.shade900),
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(0),
              // shrinkWrap: true,
              key: controller.dropunit,
              itemCount: unit.length,
              itemBuilder: (context, index) {
                final u = unit[index];

                return Obx(
                  () => CheckboxListTile(
                    title: Text(u.kdUnit),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('No. Seri: ${u.noSeri} • ${u.kondisi!.kondisi}'),
                        const SizedBox(height: 8),
                        Text('${u.barang!.spkBarang}'),
                      ],
                    ),
                    value: controller.slctUnitId.contains(u.id),
                    onChanged: (value) {
                      if (value == true) {
                        controller.slctUnitId.add(u.id);
                      } else {
                        controller.slctUnitId.remove(u.id);
                      }
                      controller.updateCheck();
                    },
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
