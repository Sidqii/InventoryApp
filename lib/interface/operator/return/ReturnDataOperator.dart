import 'package:flutter/material.dart';
import 'package:pusdatin_end/interface/operator/return/ReturnButtonOperator.dart';
import 'package:pusdatin_end/model/app_riwayat.dart';
import 'package:pusdatin_end/utils/Formatter.dart';

class ReturnDataOperator extends StatelessWidget {
  final AppRiwayatModel model;

  const ReturnDataOperator({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    //value
    final tggl = Formatter.dateID(model.kembali ?? '');
    final insi = model.instansi ?? '';
    final user = model.pemohon.nama ?? '';

    //style
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Nama Barang & Merk
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              model.detail.first.unitmodel.produk?.barang ?? '-',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          model.detail.first.unitmodel.produk?.merk ?? '',
          style: TextStyle(color: Colors.grey[600]),
        ),
        const SizedBox(height: 10),

        // Serial Numbers
        const Text("Seri Unit:"),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: model.detail.map((det) {
            final kode = det.unitmodel.seri ?? '-';
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                kode,
                style: const TextStyle(fontSize: 13),
              ),
            );
          }).toList(),
        ),

        const SizedBox(height: 12),
        Divider(),

        // Info Peminjam
        Row(
          children: [
            const Icon(Icons.person, size: 16),
            const SizedBox(width: 8),
            Text(user),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(Icons.business, size: 16),
            const SizedBox(width: 8),
            Text(insi),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(Icons.calendar_today, size: 16),
            const SizedBox(width: 8),
            Text('Due: $tggl'),
          ],
        ),

        const SizedBox(height: 12),
        ReturnButtonOperator()
      ],
    );
  }
}
