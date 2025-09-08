import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/modules/operator/controllers/operator_edit_controller.dart';

class EditSumVendor extends GetView<OperatorEditController> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      controller: controller.ctrlSumVendor,
      style: const TextStyle(fontSize: 12),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        labelText: 'Sumber Vendor',
        labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
