import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:inven/app/modules/operator/views/inventaris/operator_inven_view.dart';
import 'package:inven/app/modules/operator/views/persetujuan/persetujuan_view.dart';
import 'package:inven/app/modules/operator/views/profile/operator_profile_view.dart';
import 'package:inven/app/modules/operator/views/pemrosesan/PemrosesanPanel.dart';
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

            const PersetujuanView(),

            PemrosesanPanel(),

            const OperatorProfileView(),
          ],
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            showSelectedLabels: false,
            showUnselectedLabels: false,

            currentIndex: controller.isIndex.value,
            onTap: controller.onChangePage,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.inventory), label: ''),

              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: '',
              ),

              BottomNavigationBarItem(icon: Icon(Icons.all_inbox), label: ''),

              BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
            ],
          ),
        ),
      );
    });
  }
}
