import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/operator/CtrlEditInven.dart';
import 'package:pusdatin_end/model/app_barang.dart';
import 'package:pusdatin_end/utils/Formatter.dart';

class InvenEditPanel extends StatelessWidget {
  final AppBarangModel data;
  final ctrl = Get.find<CtrlEditInven>();

  InvenEditPanel({
    required this.data,
    super.key,
  }) {
    ctrl.init(data);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Edit data barang',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.red.shade300,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text('Nama barang :'),
              const SizedBox(width: 5),
              Expanded(
                child: TextField(
                  cursorColor: Colors.black,
                  controller: ctrl.barang,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(),
                    hintText: 'Nama Barang',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Obx(
            () => Table(
              columnWidths: const {
                0: FixedColumnWidth(150),
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
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Nilai',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
                          toTitleCase(key),style: TextStyle(fontSize: 14),
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
            ),
          )
        ],
      ),
    );
  }
}
