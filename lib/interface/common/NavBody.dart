import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/common/CtrlNavigasi.dart';

class NavBody extends StatelessWidget {
  const NavBody({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlNavigasi>();

    return Obx(() {
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 380),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: KeyedSubtree(
          key: ValueKey(ctrl.currentIndex.value),
          child: ctrl.pages[ctrl.currentIndex.value],
        ),
      );
    });
  }
}
