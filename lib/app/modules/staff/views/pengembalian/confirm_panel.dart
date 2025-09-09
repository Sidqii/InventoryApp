import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/data/models/AppPengajuan.dart';
import 'package:inven/app/modules/staff/controllers/staff_controller.dart';

class ConfirmPanel extends GetView<StaffController> {
  final AppPengajuan model;

  const ConfirmPanel({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    final nama_barang = model.unit?.first.barang?.nmBarang ?? '-';
    final tgl_kembali = model.kembaliTgl;

    final end = DateTime.parse(tgl_kembali.toString());

    final sisa = end.difference(DateTime.now());
    final sisaHari = sisa.inDays;
    final sisaJam = sisa.inHours % 24;
    final sisaMenit = sisa.inMinutes % 60;

    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Kembalikan $nama_barang?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              Icon(Icons.watch_later_outlined, size: 15),

              const SizedBox(width: 5),

              Text(
                sisa.isNegative
                    ? 'Sudah jatuh tempo'
                    : '$sisaHari hari : $sisaJam jam : $sisaMenit menit',
              ),
            ],
          ),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    'Ga',
                    style: TextStyle(color: Colors.black),
                  ),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade900,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    'Ya',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
