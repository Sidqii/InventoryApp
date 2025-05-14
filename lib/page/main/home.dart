import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/module/controller/ctrl_user.dart';
import 'package:pusdatin_end/widget/customappbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Get.find<CtrlUser>().user.value;
    return Scaffold(
      appBar: CustomAppbar(
        title: user?.role.toString()??'',
        boldTitle: user?.username??'',
        onNotifPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text(user)
              ],
            )
          ],
        ),
      ),
    );
  }
}
