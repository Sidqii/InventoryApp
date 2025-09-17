import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/modules/staff/controllers/staff_controller.dart';

class AjukanUnit extends GetView<StaffController> {
  @override
  Widget build(BuildContext context) {
    final title = const TextStyle(fontSize: 14);

    return Column(
      children: [
        Obx(
          () => CheckboxListTile(
            contentPadding: const EdgeInsets.all(0),
            title: Text('Semua', style: title),
            dense: true,
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
                child: Center(
                  child: Text(
                    'Tidak ada unit tersedia',
                    style: TextStyle(color: Colors.grey.shade900),
                  ),
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(0),
              key: controller.dropunit,
              itemCount: unit.length,
              itemBuilder: (context, index) {
                final u = unit[index];

                return Obx(
                  () => CheckboxListTile(
                    contentPadding: const EdgeInsets.all(0),
                    dense: true,

                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //kode unit barang
                        Text(
                          u.kdUnit,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),

                        //badge no seri unit
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 2,
                            ),
                            child: Text(
                              u.noSeri,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    subtitle: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          '${u.barang!.spkBarang}',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
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
