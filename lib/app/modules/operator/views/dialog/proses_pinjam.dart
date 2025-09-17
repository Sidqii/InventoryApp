import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/data/models/AppPengajuan.dart';
import 'package:inven/app/modules/operator/controllers/operator_controller.dart';

class ProsesPinjam extends GetView<OperatorController> {
  final AppPengajuan model;

  const ProsesPinjam({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    final pemohon = model.pengguna?.nama ?? '-';
    final keperluan = model.hal ?? '';

    final textStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

    final titleStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.blue.shade600,
    );

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 5),

          Row(
            children: [
              Text('  Setujui pengajuan ', style: textStyle),
              Text('$pemohon', style: titleStyle),
              Text('?', style: textStyle),
            ],
          ),

          const SizedBox(height: 25),

          Expanded(
            child: TextField(
              controller: TextEditingController(text: keperluan),
              readOnly: true,
              enabled: false,
              maxLines: null,
              style: TextStyle(color: Colors.grey.shade900, fontSize: 12),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.notes, color: Colors.grey.shade900),
                isDense: true,
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey.shade50),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 10,
                ),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Get.back();
                  controller.updtData(model.id, 1);
                  controller.refresh();
                },
                child: const Text('Ga', style: TextStyle(color: Colors.black)),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade900,
                ),
                onPressed: () {
                  Get.back();
                  controller.updtData(model.id, 4);
                  controller.refresh();
                },
                child: const Text('Ya', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
