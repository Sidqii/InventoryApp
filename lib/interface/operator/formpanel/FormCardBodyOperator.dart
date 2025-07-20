import 'package:flutter/material.dart';
import 'package:pusdatin_end/model/app_riwayat.dart';
import 'package:pusdatin_end/utils/Formatter.dart';

class FormCardBodyOperator extends StatelessWidget {
  final AppRiwayatModel item;

  const FormCardBodyOperator({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xffF4F7F7),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Detail unit barang:',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 8),
              Table(
                columnWidths: const {
                  0: FixedColumnWidth(45),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(2),
                  3: FlexColumnWidth(2),
                  4: FlexColumnWidth(2),
                },
                border: TableBorder.all(color: Colors.grey.shade300),
                children: [
                  const TableRow(
                    decoration: BoxDecoration(color: Color(0xFFEFEFEF)),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Center(
                          child: Text(
                            'No.',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Kode unit barang',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'No. Seri unit',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Status unit barang',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Lokasi unit barang',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ...item.detail.asMap().entries.map((entry) {
                    final index = entry.key +1;
                    final unit = entry.value;
                    final u = unit.unitmodel;

                    return TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6),
                          child: Center(
                            child: Text(
                              index.toString(),
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6),
                          child: Text(
                            u.kode,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6),
                          child: Text(
                            u.seri ?? '-',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6),
                          child: Text(
                            Formatter.GetStatus(u.status),
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6),
                          child: Text(
                            Formatter.GetLokasi(u.lokasi),
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    );
                  }).toList()
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
