import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/module/controller/ctrl_pengajuan.dart';
import 'package:pusdatin_end/widget/customappbar.dart';

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({super.key});

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  final CtrlPengajuan controller = Get.put(CtrlPengajuan());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Riwayat',
        boldTitle: 'Barang',
        showNotif: false,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (controller.listPengajuan.isEmpty) {
          return Center(
            child: Text('Tidak ada data'),
          );
        }
        return ListView.builder(
          itemCount: controller.listPengajuan.length,
          itemBuilder: (context, index) {
            final item = controller.listPengajuan[index];
            return ListTile(
              title: Text(item['hal'] ?? 'Kosong'),
              subtitle: Text(item['instansi'] ?? 'Kosong'),
            );
          },
        );
      }),
    );
  }
}
