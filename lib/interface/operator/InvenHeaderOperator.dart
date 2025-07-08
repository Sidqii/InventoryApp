import 'package:flutter/material.dart';
import 'package:pusdatin_end/model/app_barang.dart';
import 'package:pusdatin_end/utils/Formatter.dart';

class InvenHeaderOperator extends StatelessWidget {
  final AppBarangModel inven;

  const InvenHeaderOperator({
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
                    '${inven.barang} | ${inven.total} unit',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                      size: 20,
                    ),
                  )
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    inven.vendor,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      '${inven.garansi.toString()} bulan',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Unit: ',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    inven.jenis.jenis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
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
                            fontSize: 12,
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
                children: [
                  Text(
                    '*',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Catatan perawatan: ',
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    inven.note,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deskripsi Unit:',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      inven.deskripsi,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '${inven.sumber} ',
                    style: TextStyle(
                      fontSize: 10,
                      // fontWeight: FontWeight.bold,
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
