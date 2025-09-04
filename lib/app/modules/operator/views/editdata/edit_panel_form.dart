import 'package:flutter/material.dart';
import '../editdata/EditDeskBarang.dart';
import '../editdata/EditJenisBarang.dart';
import '../editdata/EditKategoriBarang.dart';
import '../editdata/EditMerkBarang.dart';
import '../editdata/EditNamaBarang.dart';
import '../editdata/EditNoteBarang.dart';
import '../editdata/EditSpekBarang.dart';
import '../editdata/EditSumVendor.dart';

class EditPanelForm extends StatelessWidget {
  const EditPanelForm({super.key});

  @override
  Widget build(BuildContext context) {
    final txtStyle = const TextStyle(
      fontSize: 14,
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.bold,
    );

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('Informasi barang     ', style: txtStyle),

            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: EditNamaBarang()),
                const SizedBox(width: 20),
                Expanded(child: EditJenisBarang()),
              ],
            ),

            const SizedBox(height: 10),
            EditSumVendor(),

            const SizedBox(height: 20),
            Text('Detail barang     ', style: txtStyle),

            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: EditMerkBarang()),
                const SizedBox(width: 20),
                Expanded(child: EditKategoriBarang()),
              ],
            ),

            const SizedBox(height: 10),
            EditDeskBarang(),

            const SizedBox(height: 20),
            Text('Catatan barang     ', style: txtStyle),

            const SizedBox(height: 15),
            EditSpekBarang(),

            const SizedBox(height: 20),
            EditNoteBarang(),
          ],
        ),
      ),
    );
  }
}
