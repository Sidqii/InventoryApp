import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:inven/app/global/widgets/CustomAppBar.dart';
import 'package:inven/app/modules/staff/controllers/staff_controller.dart';
import 'package:inven/app/modules/staff/views/pengembalian/PengembalianBody.dart';
import 'package:inven/app/modules/staff/views/pengembalian/PengembalianEmpty.dart';

class PengembalianPanel extends GetView<StaffController> {
  const PengembalianPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppbar(
          title: 'Pengembalian',
          boldTitle: 'Barang',
          showNotif: false,
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              if (controller.pinjamlist.isEmpty) {
                return PengembalianEmpty();
              }

              return ListView.separated(
                padding: const EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  final item = controller.pinjamlist[index];

                  return PengembalianBody(model: item);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10);
                },
                itemCount: controller.pinjamlist.length,
              );
            }),
          ),
        ),
      ],
    );
  }
}
