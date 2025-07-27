import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/common/CtrlRiwayat.dart';
import 'package:pusdatin_end/controller/operator/CtrlSubmit.dart';
import 'package:pusdatin_end/widget/customappbar.dart';

class ReturnPanelOperator extends StatelessWidget {
  const ReturnPanelOperator({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(CtrlSubmit());
    final rwyt = Get.find<CtrlRiwayat>();

    final fltr = rwyt.riwayat.where((item) {
      return item.status == 2;
    }).toList();

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
        if (rwyt.riwayat.isEmpty) {
          return Center(
            child: Text('Datanya kosong'),
          );
        }
        return ListView.builder(
          itemCount: fltr.length,
          itemBuilder: (context, index) {
            final item = fltr[index];

            return Card(
              child: ListTile(
                title: Text('${item.pemohon.nama} - ${item.instansi}'),
                subtitle: Text(item.hal ?? ' - '),
                trailing: Text(item.pinjam ?? ' - '),
              ),
            );
          },
        );
      }),
    );
  }
}
