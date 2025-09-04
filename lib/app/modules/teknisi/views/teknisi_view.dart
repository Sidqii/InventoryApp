import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/teknisi_controller.dart';

class TeknisiView extends GetView<TeknisiController> {
  const TeknisiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TeknisiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TeknisiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
