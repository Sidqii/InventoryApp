import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/module/controller/ctrl_panel.dart';
import 'package:pusdatin_end/module/controller/ctrl_pengajuan.dart';
import 'package:pusdatin_end/widget/customappbar.dart';

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({super.key});

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  final ctrlpengajuan = Get.put(CtrlPengajuan());
  final ctrlpanel = Get.put(CtrlPanel());

  @override
  void initState() {
    super.initState();
    ctrlpanel.loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Riwayat', boldTitle: 'Pengajuan'),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'ON',
              style: TextStyle(
                fontSize: 18,
                letterSpacing: 1,
              ),
            ),
            const Text(
              ' GOING',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
