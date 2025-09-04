import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/atasan_controller.dart';

class AtasanView extends GetView<AtasanController> {
  const AtasanView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AtasanView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AtasanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
