import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:inven/app/modules/operator/views/inventaris/operator_inven_view.dart';
import '../controllers/operator_nav_controller.dart';

class OperatorView extends GetView<OperatorNavController> {
  const OperatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: controller.isIndex.value,
          children: [
            const OperatorInvenView(),

            const Center(child: Text('page 2')),

            const Center(child: Text('page 3')),

            const Center(child: Text('page 4')),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: controller.isIndex.value,
          onTap: controller.onChangePage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.inventory), label: ''),

            BottomNavigationBarItem(icon: Icon(Icons.folder), label: ''),

            BottomNavigationBarItem(icon: Icon(Icons.all_inbox), label: ''),

            BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          ],
        ),
      );
    });
  }
}
