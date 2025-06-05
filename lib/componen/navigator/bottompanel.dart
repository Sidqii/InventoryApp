import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/ctrl_navigasi.dart';

class BottomPanel extends StatelessWidget {
  const BottomPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlNavigasi>();

    return Obx(() {
      return BottomNavigationBar(
        items: ctrl.navItems,
        currentIndex: ctrl.currentIndex.value,
        onTap: ctrl.changePage,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      );
    });
  }
}
