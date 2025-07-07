import 'package:flutter/material.dart';
import 'package:pusdatin_end/dataset/model/app_barang.dart';

class Invenheader extends StatelessWidget {
  final AppBarangModel inven;

  const Invenheader({
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
                    inven.kategori.kategori,
                    style: const TextStyle(),
                  ),
                ],
              ),
              Text(
                inven.kode,
                style: const TextStyle(fontSize: 9, letterSpacing: 1),
              ),
              const Divider(color: Colors.grey),
              Row(
                children: [
                  Text(
                    'Jumlah tersedia: ',
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
                    'Spesifikasi: ',
                    style: const TextStyle(fontSize: 12),
                  ),
                  ...inven.spesifikasi.entries.map((entry) {
                    final key = entry.key
                        .replaceAll('_', ' ')
                        .split(' ')
                        .map((word) =>
                            word[0].toUpperCase() +
                            word.substring(1).toLowerCase())
                        .join(' ');
                    return Text(
                      '  • $key: ${entry.value}',
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    );
                  }),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
