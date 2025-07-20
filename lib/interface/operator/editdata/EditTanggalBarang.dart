import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:pusdatin_end/controller/operator/CtrlEditInven.dart';
import 'package:pusdatin_end/utils/Formatter.dart';

class EditTanggalBarang extends StatelessWidget {
  const EditTanggalBarang({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlEditInven>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: 135,
          child: Text('Tanggal Pengadaan'),
        ),
        const Text(':'),
        const SizedBox(width: 5),
        Expanded(
          child: Obx(() {
            return GestureDetector(
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: ctrl.pengadaan.value,
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: const ColorScheme.light(
                          primary: Colors.black,
                          onPrimary: Colors.white,
                          onSurface: Colors.black,
                        ),
                      ),
                      child: child!,
                    );
                  },
                );

                if (picked != null) {
                  ctrl.pengadaan.value = picked;
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black54),
                  ),
                ),
                child: Text(
                  Formatter.dateID(
                    ctrl.pengadaan.value.toIso8601String(),
                  ),
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
