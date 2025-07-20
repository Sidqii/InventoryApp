import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/operator/CtrlEditInven.dart';

class EditCatatanBarang extends StatelessWidget {
  const EditCatatanBarang({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlEditInven>();

    return Row(
      children: [
        const SizedBox(
          width: 135,
          child: Text('Catatan'),
        ),
        const Text(':'),
        const SizedBox(width: 5),
        Expanded(
          child: TextField(
            cursorColor: Colors.black,
            controller: ctrl.note,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(left: 10, right: 10),
              focusedBorder: UnderlineInputBorder(),
              hintText: 'Catatan',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
