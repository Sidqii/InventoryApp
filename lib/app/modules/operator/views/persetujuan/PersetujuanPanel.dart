import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:inven/app/global/widgets/CustomAppBar.dart';
import 'package:inven/app/modules/operator/controllers/operator_controller.dart';
import 'package:inven/app/modules/operator/views/persetujuan/PersetujuanBody.dart';

class PersetujuanPanel extends GetView<OperatorController> {
  const PersetujuanPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppbar(title: 'Proses', boldTitle: 'Pengajuan', showNotif: false),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              return ListView.separated(
                padding: const EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  final item = controller.pengajuan[index];

                  return PersetujuanBody(model: item);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 0);
                },
                itemCount: controller.pengajuan.length,
              );
            }),
          ),
        ),
      ],
    );
  }
}
