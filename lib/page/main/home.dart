import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/ctrl_user.dart';
import 'package:pusdatin_end/utils/formattter.dart';
import 'package:pusdatin_end/widget/customappbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Get.find<CtrlUser>().user.value;

    return Scaffold(
      appBar: CustomAppbar(
        title: getRole(user?.role ?? 0),
        boldTitle: user?.username ?? '',
        onNotifPressed: () {},
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
