import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/interface/common/HomePage.dart';
import 'package:pusdatin_end/interface/staff/01_HomeStaff.dart';
import 'package:pusdatin_end/interface/common/HomeInventaris.dart';
import 'package:pusdatin_end/interface/operator/00_HomeOperator.dart';

class CtrlNavigasi extends GetxController {
  final currentIndex = 0.obs;
  final roleuser = ''.obs;

  List<Widget> get pages {
    if (roleuser.value == '1') {
      return [
        HomePage(),
        HomeInventaris(),
        HomeOperator(),
      ];
    } else if (roleuser.value == '2') {
      return [
        HomePage(),
        HomeInventaris(),
        HomeStaff(),
      ];
    } else {
      return [
        Center(
          child: Text('Role tidak diketahui'),
        )
      ];
    }
  }

  List<BottomNavigationBarItem> get navItems {
    if (roleuser.value == '1') {
      return const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.inventory),
          label: 'Inventaris',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'Riwayat',
        ),
      ];
    } else if (roleuser.value == '2') {
      return const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.inventory),
          label: 'Inventaris',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.approval),
          label: 'Pengajuan',
        ),
      ];
    } else {
      return const [
        BottomNavigationBarItem(icon: Icon(Icons.error)),
      ];
    }
  }

  void changePage(int index) {
    currentIndex.value = index;
  }

  void setRole(String role) {
    roleuser.value = role;
  }
}
