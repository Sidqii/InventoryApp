import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/modules/operator/controllers/operator_edit_controller.dart';

class EditNoteBarang extends GetView<OperatorEditController> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.ctrlNote,
      cursorColor: Colors.black,
      style: const TextStyle(fontSize: 12),
      maxLines: null,
      decoration: const InputDecoration(
        labelText: 'Catatan Pemeliharaan',
        labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        hintText: 'Tuliskan detail pemeliharaan di sini...',
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
