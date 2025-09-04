import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/modules/staff/controllers/staff_controller.dart';

class AjukanInstansi extends GetView<StaffController> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      controller: controller.ctrlInstansi,
      readOnly: true,
      decoration: const InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        labelText: 'Instansi',
        labelStyle: TextStyle(color: Colors.grey),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
