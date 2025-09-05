import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inven/app/modules/staff/views/pengajuan/staff_ajukan_view.dart';
import 'package:inven/app/modules/staff/views/pengembalian/staff_pengembalian_view.dart';
import 'package:inven/app/modules/staff/views/riwayat/staff_riwayat_view.dart';

import '../controllers/staff_controller.dart';

class StaffView extends GetView<StaffController> {
  const StaffView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: controller.isIndex.value,
          children: [
            StaffAjukanView(),

            StaffRiwayatView(), //masih dummy

            StaffPengembalianView(),

            const Center(child: Text('profil')), //masih dummy
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
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box),
              label: 'Peminjaman barang',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Riwayat',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.view_list),
              label: 'Pengembalian barang',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil pengguna',
            ),
          ],
        ),
      );
    });
  }
}
