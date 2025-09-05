import 'package:flutter/material.dart';
import 'package:inven/app/data/models/AppPengajuan.dart';
import 'package:inven/app/global/utils/Formatter.dart';

class RiwayatData extends StatelessWidget {
  final AppPengajuan model;

  const RiwayatData({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    final nama_barang = model.unit?.first.barang?.nmBarang ?? '-';
    final kode_pinjam = model.id.toString();
    final status = model.status!.status;
    final tanggal = model.kembaliTgl;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              nama_barang,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(kode_pinjam, style: TextStyle(color: Colors.white)),
            ),
          ],
        ),

        Row(children: [Icon(Icons.inventory, size: 15), Text(' $status')]),

        const SizedBox(height: 10),

        Row(
          children: [
            Icon(Icons.calendar_month, size: 15),
            Text(' ${Formatter.dateID(tanggal)}'),
          ],
        ),

        const Divider(),

        ...model.unit!.map((u) {
          return ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.input),
            title: Text(u.kdUnit),
            subtitle: Text('No. Seri: ${u.noSeri} • ${u.kondisi?.kondisi}'),
          );
        }).toList(),
      ],
    );
  }
}
