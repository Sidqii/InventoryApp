import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/data/models/AppBarang.dart';
import 'package:inven/app/modules/operator/controllers/operator_edit_controller.dart';

class EditPanelHeader extends GetView<OperatorEditController> {
  final AppBarang model;

  const EditPanelHeader({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    final nama_barang = model.nmBarang;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Edit data:', style: TextStyle(fontSize: 12)),

            Text(
              nama_barang,
              style: TextStyle(
                color: Colors.blue.shade600,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        IconButton(
          onPressed: () {
            return Get.back();
          },
          icon: Icon(Icons.close, color: Colors.red.shade500),
        ),
      ],
    );
  }
}
