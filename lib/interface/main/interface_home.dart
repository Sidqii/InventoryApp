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
        title: getRole(ctrl.role ?? 0),
        boldTitle: ctrl.nama ?? '',
        onNotifPressed: () {},
      ),
    );
  }
}
