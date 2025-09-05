import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/global/widgets/CustomAppBar.dart';
import 'package:inven/app/global/widgets/CustomFilterChips.dart';
import 'package:inven/app/modules/staff/controllers/staff_controller.dart';
import 'package:inven/app/modules/staff/views/riwayat/RiwayatBody.dart';

class RiwayatPanel extends GetView<StaffController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppbar(title: 'Riwayat', boldTitle: 'Peminjaman'),

        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() {
                return CustomFilterChips(
                  opsi: controller.opsFltr,
                  select: controller.slctOps.value,
                  isSelect: (val) {
                    controller.slctOps.value = val;
                    controller.filterChips();
                  },
                );
              }),

              IconButton(
                onPressed: () {
                  controller.refresh();
                },
                icon: Icon(Icons.refresh),
              ),
            ],
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.riwayatFltr.isEmpty) {
                return Center(child: Text('kosong'));
              }

              return ListView.separated(
                itemBuilder: (context, index) {
                  final item = controller.riwayatFltr[index];

                  return RiwayatBody(model: item);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox();
                },
                itemCount: controller.riwayatFltr.length,
              );
            }),
          ),
        ),
      ],
    );
  }
}
