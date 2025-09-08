import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/data/models/AppBarang.dart';
import 'package:inven/app/global/utils/Formatter.dart';
import 'package:inven/app/global/widgets/CustomShowDialog.dart';
import 'package:inven/app/modules/operator/views/editdata/operator_edit_view.dart';

class InvenData extends StatelessWidget {
  final AppBarang model;

  const InvenData({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    final barang = model.nmBarang; //nama barang
    final merk = model.merk; //merk barang
    final kode = model.kdBarang; //kode barang
    final vendor = model.vendor; //vendor barang
    final garansi = model.garansi; //garansi barang
    final jenis = model.jenis!.jenis; //jensi barang
    final note = model.note!; //catatan perawatan
    final desk = model.deskripsi!; //deskripsi
    final sumber = model.sumBarang; //sumber pengadaan barang
    final pengadaan = model.pengadaan; //tanggal pengadaan barang

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //nama barang dan tombol edit
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //nama barang
            Text(barang, style: const TextStyle(fontWeight: FontWeight.bold)),

            //tombol untuk memunculkan edit data barang
            IconButton(
              onPressed: () {
                Get.dialog(
                  CustomShowDialog(
                    heightFactor: 0.70,
                    child: OperatorEditView(model: model),
                  ),
                );
              },
              icon: Icon(Icons.edit, size: 20),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //merk barang
            Text(
              merk,
              style: const TextStyle(
                fontSize: 11,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),

            //kode barang
            Text(kode, style: const TextStyle(fontSize: 11, letterSpacing: 1)),
          ],
        ),

        const Divider(color: Colors.grey),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //vendor sumber barang
            Text(
              vendor,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),

            //badge garansi barang
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                '${garansi.toString()} bulan',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),

        //jenis barang
        Row(
          children: [
            Text('Jenis: ', style: const TextStyle(fontSize: 12)),
            Text(
              jenis,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),

        const SizedBox(height: 3),

        //catatan perawatan
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Catatan: ', style: const TextStyle(fontSize: 12)),
            Flexible(
              child: Text(
                note,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        //deskripsi  barang
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
                'Deskripsi Barang:',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(desk, style: const TextStyle(fontSize: 12)),
            ],
          ),
        ),

        const SizedBox(height: 5),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //sumber barang
            Text('$sumber ', style: TextStyle(fontSize: 12)),

            //tanggal pengadaan
            Text(
              Formatter.dateID(pengadaan),
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
