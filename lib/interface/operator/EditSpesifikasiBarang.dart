import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/operator/CtrlEditInven.dart';
import 'package:pusdatin_end/utils/Formatter.dart';

class EditSpesifikasiBarang extends StatelessWidget {
  const EditSpesifikasiBarang({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlEditInven>();

    return Obx(() {
      return Table(
        columnWidths: const {
          0: FixedColumnWidth(135),
          1: FlexColumnWidth(),
        },
        border: TableBorder.all(color: Colors.grey.shade400),
        children: [
          // Header
          const TableRow(
            decoration: BoxDecoration(color: Color(0xFFE0E0E0)),
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Spesifikasi',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Nilai',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          // Isi dari spesifikasi
          ...ctrl.spesifikasi.entries.map((entry) {
            final key = entry.key;
            final value = entry.value;
            return TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    Formatter.toTitleCase(key),
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: TextField(
                    style: const TextStyle(fontSize: 14),
                    cursorColor: Colors.black,
                    controller: value,
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 8,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            );
          }).toList()
        ],
      );
    });
  }
}
