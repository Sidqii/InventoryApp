import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/module/controller/ctrl_persetujuan.dart';
import 'package:pusdatin_end/widget/customappbar.dart';

class PersetujuanPage extends StatefulWidget {
  const PersetujuanPage({super.key});

  @override
  State<PersetujuanPage> createState() => _PersetujuanPageState();
}

class _PersetujuanPageState extends State<PersetujuanPage> {
  final ctrlpersetujuan = Get.put(CtrlPersetujuan());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Persetujuan', boldTitle: 'Peminjaman'),
      body: const Center(
        child: const Row(
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
