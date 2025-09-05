import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/global/widgets/CustomAppBar.dart';
import 'package:inven/app/modules/staff/controllers/staff_controller.dart';
import 'package:inven/app/modules/staff/views/riwayat/RiwayatBody.dart';

class RiwayatPanel extends GetView<StaffController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppbar(title: 'Riwayat', boldTitle: 'Peminjaman'),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.riwayatList.isEmpty) {
                return Center(child: Text('kosong'));
              }

              return ListView.separated(
                itemBuilder: (context, index) {
                  final item = controller.riwayatList[index];

                  return RiwayatBody(model: item);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox();
                },
                itemCount: controller.riwayatList.length,
              );
            }),
          ),
        ),
      ],
    );
  }
}
