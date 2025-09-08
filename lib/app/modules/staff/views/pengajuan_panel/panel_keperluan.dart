import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/modules/staff/controllers/staff_controller.dart';

class PanelKeperluan extends GetView<StaffController> {
  const PanelKeperluan({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(text: controller.ctrlKeperluan.text),
      readOnly: true,
      enabled: false,
      maxLines: null,
      style: TextStyle(color: Colors.grey.shade900, fontSize: 12),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.notes, color: Colors.grey.shade900),
        label: Text('Keperluan'),
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
