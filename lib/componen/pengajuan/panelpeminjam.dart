import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/ctrl_user.dart';

class PanelPeminjam extends StatelessWidget {
  const PanelPeminjam({super.key});

  @override
  Widget build(BuildContext context) {
    final userctrl = Get.find<CtrlUser>().user.value!;

    return TextFormField(
      initialValue: userctrl.nama,
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'Peminjam',
        labelStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.transparent,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
