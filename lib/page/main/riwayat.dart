import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/module/controller/ctrl_pengajuan.dart';
import 'package:pusdatin_end/widget/customappbar.dart';

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({super.key});

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  final CtrlPengajuan ctrlPengajuan = Get.put(CtrlPengajuan());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Riwayat', boldTitle: 'Pengajuan'),
      body: const Center(
        child: Text('Hello from RiwayatPage'),
      ),
    );
  }
}