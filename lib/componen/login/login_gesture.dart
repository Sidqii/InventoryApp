import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/interface/auth/interface_regis.dart';

class LoginGesture extends StatelessWidget {
  const LoginGesture({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 3,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text('Belum punya akun?'),
        GestureDetector(
          onTap: () {
            Get.to(
              const InterfaceRegis(),
              transition: Transition.fadeIn,
              duration: Duration(milliseconds: 500),
            );
          },
          child: const Text(
            'daftar',
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
