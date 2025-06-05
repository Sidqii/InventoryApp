import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/ctrl_navigasi.dart';

class BodyPanel extends StatelessWidget {
  const BodyPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlNavigasi>();

    return Obx(() {
      return IndexedStack(
        index: ctrl.currentIndex.value,
        children: ctrl.pages,
      );
    });
  }
}
