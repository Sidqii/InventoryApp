import 'package:flutter/material.dart';
import 'package:inven/app/data/models/AppPengajuan.dart';

class RiwayatTable extends StatelessWidget {
  final AppPengajuan model;

  const RiwayatTable({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    //style
    final title = const TextStyle(fontSize: 13);
    final titleColumn = const TextStyle(
      color: Colors.white,
      fontSize: 12,
    );
    final subTcolumn = const TextStyle(fontSize: 12);
    final padColumnT = const EdgeInsets.all(8);
    final padColumnS = const EdgeInsets.all(6);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xffF4F7F7),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Detail unit peminjaman', style: title),
      
          const SizedBox(height: 5),
      
          Table(
            columnWidths: const {
              0: FixedColumnWidth(30),
              1: FlexColumnWidth(2),
              2: FlexColumnWidth(2),
            },
            border: TableBorder.all(color: Colors.grey.shade500),
            children: [
              TableRow(
                decoration: BoxDecoration(color: Colors.grey.shade900),
                children: [
                  Padding(
                    padding: padColumnT,
                    child: Center(child: Text('No', style: titleColumn)),
                  ),
                  Padding(
                    padding: padColumnT,
                    child: Center(
                      child: Text('Kode unit barang', style: titleColumn),
                    ),
                  ),
                  Padding(
                    padding: padColumnT,
                    child: Center(
                      child: Text('No. seri unit', style: titleColumn),
                    ),
                  ),
                ],
              ),
      
              ...model.unit!.asMap().entries.map((e) {
                final nomor = e.key + 1;
                final unit = e.value;
      
                return TableRow(
                  children: [
                    Padding(
                      padding: padColumnS,
                      child: Center(
                        child: Text(nomor.toString(), style: subTcolumn),
                      ),
                    ),
                    Padding(
                      padding: padColumnS,
                      child: Text(unit.kdUnit, style: subTcolumn),
                    ),
                    Padding(
                      padding: padColumnS,
                      child: Text(unit.noSeri, style: subTcolumn),
                    ),
                  ],
                );
              }).toList(),
            ],
          ),
        ],
      ),
    );
  }
}
