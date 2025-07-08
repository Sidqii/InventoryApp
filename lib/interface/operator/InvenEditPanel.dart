import 'package:flutter/material.dart';
import 'package:pusdatin_end/model/app_barang.dart';

class InvenEditPanel extends StatelessWidget {
  final AppBarangModel data;

  const InvenEditPanel({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   "Edit Data",
          //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          // ),
          // SizedBox(height: 20),
          // Text("Isian lain di sini..."),
          const Text("Edit Data", style: TextStyle(fontSize: 18)),
          const SizedBox(height: 10),
          Text("Nama: ${data.barang}"),
          Text("Merk: ${data.merk}"),
          // dst...
        ],
      ),
    );
  }
}
