import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/common/CtrlRiwayat.dart';
import 'package:pusdatin_end/interface/operator/return/ReturnBodyOperator.dart';

class ReturnCardOperator extends StatelessWidget {
  const ReturnCardOperator({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlRiwayat>();

    return Obx(() {
      if (ctrl.isloading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      if (ctrl.riwayat.isEmpty) {
        return Center(
          child: Text('Datanya Kosong'),
        );
      }

      final fltr = ctrl.riwayat.where((item) {
        return item.status == 2;
      }).toList();

      return ListView.separated(
        itemCount: fltr.length,
        separatorBuilder: (context, index) {
          return SizedBox();
        },
        itemBuilder: (context, index) {
          final item = fltr[index];

          return ReturnBodyOperator(model: item);
        },
      );
    });
  }
}
