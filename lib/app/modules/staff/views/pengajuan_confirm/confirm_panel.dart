import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/global/widgets/CustomBtnForm.dart';
import 'package:inven/app/modules/staff/controllers/staff_controller.dart';
import 'panel_barang.dart';
import 'panel_instansi.dart';
import 'panel_keperluan.dart';
import 'panel_pemohon.dart';
import 'panel_tanggal.dart';
import 'panel_unit.dart';

class ConfirmPanel extends GetView<StaffController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade50,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Semua benar?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                IconButton(
                  visualDensity: VisualDensity.compact,
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.close, color: Colors.red.shade900),
                ),
              ],
            ),

            Text(
              'Informasi peminjam',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(child: PanelPemohon()),

                const SizedBox(width: 10),

                Expanded(child: PanelInstansi()),
              ],
            ),

            const SizedBox(height: 10),

            PanelKeperluan(),

            const SizedBox(height: 15),

            Text(
              'Detail peminjaman',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            PanelBarang(),

            const SizedBox(height: 10),

            PanelUnit(),

            const SizedBox(height: 10),

            PanelTanggal(),

            const SizedBox(height: 10),

            CustomBtnForm(
              label: 'ajukan',
              isLoading: controller.isBtnLoad.value,
              OnPress: () {
                Get.back();
                controller.pengajuan();
              },
            ),
          ],
        ),
      ),
    );
  }
}
