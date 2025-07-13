import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:pusdatin_end/controller/operator/CtrlEditInven.dart';

class EditDeskripsiBarang extends StatelessWidget {
  const EditDeskripsiBarang({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlEditInven>();

    return Row(
      children: [
        const SizedBox(
          width: 135,
          child: Text('Deskripsi'),
        ),
        const Text(':'),
        const SizedBox(width: 5),
        Expanded(
          child: TextField(
            cursorColor: Colors.black,
            controller: ctrl.deskripsi,
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(),
              hintText: 'Deskripsi',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
