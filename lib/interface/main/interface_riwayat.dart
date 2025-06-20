import 'package:flutter/material.dart';
import 'package:pusdatin_end/componen/userinterface/role1panel.dart';
import 'package:pusdatin_end/widget/customappbar.dart';

class InterfaceRiwayat extends StatelessWidget {
  const InterfaceRiwayat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Pengajuan',
        boldTitle: 'Barang',
        showNotif: true,
      ),
      body: const Role1Panel(),
    );
  }
}
