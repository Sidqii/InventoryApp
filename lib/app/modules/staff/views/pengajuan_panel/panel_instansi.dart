import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/modules/staff/controllers/staff_controller.dart';

class PanelInstansi extends GetView<StaffController> {
  const PanelInstansi({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(text: controller.ctrlInstansi.text),
      readOnly: true,
      enabled: false,
      maxLines: null,
      style: TextStyle(color: Colors.grey.shade900, fontSize: 12),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.home, color: Colors.grey.shade900),
        label: Text('Instansi'),
        labelStyle: TextStyle(
          color: Colors.grey.shade900,
          fontWeight: FontWeight.w600,
        ),
        isDense: true,
        disabledBorder: OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
      ),
    );
  }
}
