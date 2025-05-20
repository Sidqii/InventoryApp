import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/module/controller/ctrl_persetujuan.dart';

class HistorCardPanel extends StatelessWidget {
  final int idPengajuan;
  const HistorCardPanel({
    required this.idPengajuan,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ctrlperstujuan = Get.find<CtrlPersetujuan>();
    return Column(
      children: [
        //Setuju
        Expanded(
          child: ElevatedButton.icon(
            label: const Icon((Icons.checklist)),
            onPressed: () {
              ctrlperstujuan.editPengajuan(idPengajuan, 2);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff6D8B74),
            ),
          ),
        ),
        const SizedBox(width: 15),
        //Tolak
        Expanded(
          child: ElevatedButton.icon(
            label: const Icon((Icons.cancel)),
            onPressed: () {
              ctrlperstujuan.editPengajuan(idPengajuan, 2);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffF96666),
            ),
          ),
        ),
      ],
    );
  }
}
