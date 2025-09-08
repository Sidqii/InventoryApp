import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/modules/operator/controllers/operator_edit_controller.dart';

class EditDeskBarang extends GetView<OperatorEditController> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      style: const TextStyle(fontSize: 12),
      controller: controller.ctrlDesk,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        labelText: 'Deskripsi barang',
        labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
