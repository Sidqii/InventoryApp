import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/modules/operator/controllers/operator_edit_controller.dart';

class EditSpekBarang extends GetView<OperatorEditController> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.ctrlSpek,
      cursorColor: Colors.black,
      style: const TextStyle(fontSize: 12),
      maxLines: null,
      decoration: const InputDecoration(
        labelText: 'Spesifikasi Barang',
        labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        hintText: 'Tuliskan detail spesifikasi barang di sini...',
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
