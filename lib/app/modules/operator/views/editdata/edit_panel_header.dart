import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPanelHeader extends StatelessWidget {
  const EditPanelHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Edit data barang',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        IconButton(
          onPressed: () {
            return Get.back();
          },
          icon: Icon(Icons.close, color: Colors.red.shade300),
        ),
      ],
    );
  }
}
