import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/global/widgets/CustomAppBar.dart';
import 'package:inven/app/modules/operator/controllers/operator_controller.dart';
import 'package:inven/app/modules/operator/views/pemrosesan/PemrosesanBody.dart';

class PemrosesanPanel extends GetView<OperatorController> {
  const PemrosesanPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppbar(
          title: 'Proses',
          boldTitle: 'Pengembalian',
          showNotif: false,
        ),

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
                  final item = controller.kembalian[index];

                  return PemrosesanBody(model: item);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 0);
                },
                itemCount: controller.kembalian.length,
              );
            }),
          ),
        ),
      ],
    );
  }
}
