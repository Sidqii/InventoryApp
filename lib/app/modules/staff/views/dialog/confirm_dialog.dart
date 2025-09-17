import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/global/widgets/CustomBtnForm.dart';
import 'package:inven/app/modules/staff/controllers/staff_controller.dart';
import 'dialog_barang.dart';
import 'dialog_instansi.dart';
import 'dialog_keperluan.dart';
import 'dialog_pemohon.dart';
import 'dialog_tanggal.dart';
import 'dialog_unit.dart';

class ConfirmDialog extends GetView<StaffController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade50,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Expanded(child: DialogPemohon()),

                const SizedBox(width: 10),

                Expanded(child: DialogInstansi()),
              ],
            ),

            const SizedBox(height: 10),

            DialogKeperluan(),

            const SizedBox(height: 15),

            Text(
              'Detail peminjaman',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            DialogBarang(),

            const SizedBox(height: 10),

            DialogUnit(),

            const SizedBox(height: 10),

            DialogTanggal(),

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
