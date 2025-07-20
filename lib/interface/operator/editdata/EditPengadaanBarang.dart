import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/operator/CtrlEditInven.dart';

class EditPengadaanBarang extends StatelessWidget {
  const EditPengadaanBarang({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlEditInven>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: 135,
          child: Text('Sumber Pengadaan'),
        ),
        const Text(':'),
        const SizedBox(width: 5),
        Expanded(
          child: TextField(
            cursorColor: Colors.black,
            controller: ctrl.sumber,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(left: 10, right: 10),
              focusedBorder: UnderlineInputBorder(),
              hintText: 'Sumber Pengadaan',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
