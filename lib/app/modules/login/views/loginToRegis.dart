import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:inven/app/modules/register/controllers/register_controller.dart';
import 'package:inven/app/routes/app_pages.dart';

class LoginToRegis extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 3,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text('Konfigurasi url?'),
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.REGISTER);
          },
          child: const Text(
            'konfigurasi',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff4E71FF),
            ),
          ),
        ),
      ],
    );
  }
}
