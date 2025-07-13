import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:pusdatin_end/controller/operator/CtrlEditInven.dart';

class EditJenisBarang extends StatelessWidget {
  const EditJenisBarang({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlEditInven>();
    return Row(
      children: [
        const SizedBox(
          width: 135,
          child: Text('Jenis Barang'),
        ),
        const Text(':'),
        const SizedBox(width: 5),
        Expanded(
          child: TextField(
            cursorColor: Colors.black,
            controller: ctrl.jenis,
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(),
              hintText: 'Jenis Barang',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
