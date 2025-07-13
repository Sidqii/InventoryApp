import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:pusdatin_end/controller/operator/CtrlEditInven.dart';

class EditGaransiBarang extends StatelessWidget {
  const EditGaransiBarang({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlEditInven>();

    return Row(
      children: [
        const SizedBox(
          width: 135,
          child: Text('Garansi'),
        ),
        const Text(':'),
        const SizedBox(width: 5),
        Expanded(
          child: TextField(
            cursorColor: Colors.black,
            controller: ctrl.garansi,
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(),
              hintText: 'Garansi',
              suffixText: 'Bulan',
              suffixStyle: TextStyle(color: Colors.black),
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
