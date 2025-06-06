import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/ctrl_user.dart';
import 'package:pusdatin_end/utils/formattter.dart';
import 'package:pusdatin_end/widget/customappbar.dart';

class InterfaceHome extends StatelessWidget {
  const InterfaceHome({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlUser>().user.value!;

    return Scaffold(
      appBar: CustomAppbar(
        title: getRole(ctrl.role ?? 0),
        boldTitle: ctrl.username ?? '',
        onNotifPressed: () {},
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
