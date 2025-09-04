import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/public_controller.dart';

class PublicView extends GetView<PublicController> {
  const PublicView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PublicView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PublicView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
