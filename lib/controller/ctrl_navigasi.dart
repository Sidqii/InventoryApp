import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/interface/main/home.dart';
import 'package:pusdatin_end/interface/main/interface_ajukan.dart';
import 'package:pusdatin_end/interface/main/interface_inven.dart';
import 'package:pusdatin_end/interface/main/riwayat.dart';

class CtrlNavigasi extends GetxController {
  final currentIndex = 0.obs;

  List<Widget> get pages => [
    HomePage(),
    InterfaceInven(),
    InterfaceAjukan(),
    RiwayatPage(),
  ];

  List<BottomNavigationBarItem> get navItems => const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.inventory), label: 'Barang'),
    BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Pengajuan'),
    BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
  ];

  void changePage(int index) {
    currentIndex.value = index;
  }
}
