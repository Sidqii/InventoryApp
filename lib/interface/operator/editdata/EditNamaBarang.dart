import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:pusdatin_end/controller/operator/CtrlEditInven.dart';

class EditNamaBarang extends StatelessWidget {
  const EditNamaBarang({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlEditInven>();

    return Row(
      children: [
        const SizedBox(
          width: 135,
          child: Text('Nama Barang'),
        ),
        const Text(':'),
        const SizedBox(width: 5),
        Expanded(
          child: TextField(
            cursorColor: Colors.black,
            controller: ctrl.barang,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(left: 10, right: 10),
              focusedBorder: UnderlineInputBorder(),
              hintText: 'Nama Barang',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
