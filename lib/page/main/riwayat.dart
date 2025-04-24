import 'package:flutter/material.dart';

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({super.key});

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  // final ctrlRiwayat controller = Get.find()
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Hello from RiwayatPage'),
      ),
    );
  }
}