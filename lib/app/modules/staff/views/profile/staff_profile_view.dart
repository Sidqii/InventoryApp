import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/global/utils/Formatter.dart';
import 'package:inven/app/global/widgets/CustomAppBar.dart';
import 'package:inven/app/modules/staff/controllers/staff_controller.dart';

class StaffProfileView extends GetView<StaffController> {
  const StaffProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppbar(
          onTitleTap: () async {
            final result = await showMenu(
              context: context,
              position: const RelativeRect.fromLTRB(0, 60, 0, 0),
              items: [
                const PopupMenuItem<String>(
                  value: 'logout',
                  child: Text('logout'),
                ),
              ],
            );
            if (result == 'logout') {
              Get.dialog(
                AlertDialog(
                  title: const Text('logout?', style: TextStyle(fontSize: 18)),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        'Ga',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                        controller.doLogout();
                      },
                      child: const Text(
                        'Ya',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
          title: Formatter.getRole(controller.userData?.peranId ?? 0),
          boldTitle: controller.userData?.nama ?? '',
        ),
        Expanded(child: Center(child: Text('profile'))),
      ],
    );
  }
}
