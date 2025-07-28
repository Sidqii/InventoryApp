import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/common/CtrlRiwayat.dart';
import 'package:pusdatin_end/interface/operator/return/ReturnBodyOperator.dart';
import 'package:pusdatin_end/widget/customappbar.dart';

class ReturnPanelOperator extends StatelessWidget {
  const ReturnPanelOperator({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlRiwayat>();

    return Scaffold(
      appBar: CustomAppbar(
        title: 'Pengembalian',
        boldTitle: 'Barang',
      ),
      body: Obx(() {
        if (ctrl.isloading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (ctrl.riwayat.isEmpty) {
          return Center(
            child: Text('Datanya kosong'),
          );
        }

        final fltr = ctrl.riwayat.where((item) {
          return item.status == 2;
        }).toList();

        return ListView.separated(
          itemCount: fltr.length,
          separatorBuilder: (context, index) {
            return const SizedBox();
          },
          itemBuilder: (context, index) {
            final item = fltr[index];

            return ReturnBodyOperator(model: item);
          },
        );
      }),
    );
  }
}
