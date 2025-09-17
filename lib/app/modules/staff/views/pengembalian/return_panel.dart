import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/data/models/AppPengajuan.dart';
import 'package:inven/app/modules/staff/controllers/staff_controller.dart';

class ReturnPanel extends GetView<StaffController> {
  final AppPengajuan model;

  const ReturnPanel({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    final unitId = model.unit?.map((u) => u.id).toList() ?? [];
    final statId = model.status?.id ?? 0;

    final nama_barang = model.unit?.first.barang?.nmBarang ?? '-';
    final tgl_kembali = model.kembaliTgl;

    final end = DateTime.parse(tgl_kembali.toString());

    final sisa = end.difference(DateTime.now());
    final sisaHari = sisa.inDays;
    final sisaJam = sisa.inHours % 24;
    final sisaMenit = sisa.inMinutes % 60;

    final count_down = Text(
      '$sisaHari hari : $sisaJam jam : $sisaMenit menit',
      style: TextStyle(fontWeight: FontWeight.bold),
    );

    final jatuh_tempo = Text(
      'Sudah jatuh tempo',
      style: TextStyle(color: Colors.red.shade400),
    );

    final textStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

    final titleStyle = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      color: Colors.blue.shade600,
    );

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Kembalikan:', style: textStyle),

                  Text('$nama_barang', style: titleStyle),
                ],
              ),

              IconButton(
                visualDensity: VisualDensity.compact,
                onPressed: () => Get.back(),
                icon: Icon(Icons.close, color: Colors.red.shade400),
              ),
            ],
          ),

          const SizedBox(height: 15),

          Row(
            children: [
              Icon(Icons.watch_later_outlined, size: 15),

              const SizedBox(width: 5),

              sisa.isNegative ? jatuh_tempo : count_down,
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
                    controller.pengembalian(model.id, unitId, statId);
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
