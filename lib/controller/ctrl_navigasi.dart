import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/interface/main/interface_home.dart';
import 'package:pusdatin_end/interface/main/interface_staff.dart';
import 'package:pusdatin_end/interface/main/interface_inven.dart';
import 'package:pusdatin_end/interface/main/interface_operator.dart';

class CtrlNavigasi extends GetxController {
  final currentIndex = 0.obs;
  final roleuser = ''.obs;

  List<Widget> get pages {
    if (roleuser.value == '1') {
      return [
        InterfaceHome(),
        InterfaceInven(),
        InterfaceOperator(),
      ];
    } else if (roleuser.value == '2') {
      return [
        InterfaceHome(),
        InterfaceInven(),
        InterfaceStaff(),
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
