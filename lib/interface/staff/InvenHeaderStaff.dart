import 'package:flutter/material.dart';
import 'package:pusdatin_end/model/app_barang.dart';
import 'package:pusdatin_end/utils/Formatter.dart';

class InvenHeaderStaff extends StatelessWidget {
  final AppBarangModel inven;

  const InvenHeaderStaff({
    required this.inven,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    inven.barang,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    inven.jenis.jenis,
                    style: const TextStyle(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    inven.merk,
                    style: const TextStyle(
                      fontSize: 9,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    inven.kode,
                    style: const TextStyle(fontSize: 9, letterSpacing: 1),
                  ),
                ],
              ),
              const Divider(color: Colors.grey),
              Row(
                children: [
                  Text(
                    'Jumlah Unit Aktif: ',
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    inven.total.toString(),
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Spesifikasi Unit: ',
                    style: const TextStyle(fontSize: 12),
                  ),
                  ...inven.spesifikasi.entries.map((entry) {
                    final key = toTitleCase(entry.key);
                    return Column(
                      children: [
                        const SizedBox(height: 2),
                        Text(
                          '  • $key: ${entry.value}',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '${inven.sumber} ',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    inven.pengadaan,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
