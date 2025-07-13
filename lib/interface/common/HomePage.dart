import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/common/CtrlUser.dart';
import 'package:pusdatin_end/utils/Formatter.dart';
import 'package:pusdatin_end/widget/customappbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlUser>().user.value!;

    return Scaffold(
      appBar: CustomAppbar(
        onTitleTap: () async {
          final result = await showMenu(
            context: context,
            position: const RelativeRect.fromLTRB(0, 60, 0, 0),
            items: [
              const PopupMenuItem<String>(
                value: 'logout',
                child: Text('Logout'),
              ),
            ],
          );
          if (result == 'logout') {
            Get.dialog(
              AlertDialog(
                title: const Text(
                  'Logout?',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(
                      'Ga',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                      Get.find<CtrlUser>().logout();
                    },
                    child: const Text(
                      'Ya',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
        title: Formatter.getRole(ctrl.role ?? 0),
        boldTitle: ctrl.nama ?? '',
        onNotifPressed: () {},
      ),
    );
  }
}
