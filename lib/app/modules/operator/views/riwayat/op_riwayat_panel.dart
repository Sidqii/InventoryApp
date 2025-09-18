import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:inven/app/global/widgets/CustomAppBar.dart';
import 'package:inven/app/global/widgets/CustomFilterChips.dart';
import 'package:inven/app/modules/operator/controllers/operator_controller.dart';
import 'package:inven/app/modules/operator/views/riwayat/op_riwayat_body.dart';

class OpRiwayatPanel extends GetView<OperatorController> {
  const OpRiwayatPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppbar(
          title: 'Riwayat',
          boldTitle: 'Pengajuan',
          showNotif: false,
        ),

        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Obx(
                () => Expanded(
                  child: CustomFilterChips(
                    opsi: controller.opsiFilter,
                    select: controller.selectOpsi.value,
                    isSelect: (val) {
                      controller.selectOpsi.value = val;
                      controller.filterChips();
                    },
                  ),
                ),
              ),

              IconButton(
                onPressed: () => controller.refresh(),
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
                return Center(child: CircularProgressIndicator());
              }

              if (controller.riwayatFilter.isEmpty) {
                return Center(child: Text('Data kosong'));
              }

              return ListView.separated(
                padding: EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  final item = controller.riwayatFilter[index];

                  return OpRiwayatBody(model: item);
                },
                separatorBuilder: (context, index) => const SizedBox(),
                itemCount: controller.riwayatFilter.length,
              );
            }),
          ),
        ),
      ],
    );
  }
}
