import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/ctrl_register.dart';
import 'package:pusdatin_end/interface/auth/interface_login.dart';

class RegisGesture extends StatelessWidget {
  const RegisGesture({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlRegister>();

    return Row(
      spacing: 3,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text('Sudah punya akun?'),
        GestureDetector(
          onTap: () {
            ctrl.emailctrl.clear();
            ctrl.passctrl.clear();
            ctrl.confirmctrl.clear();

            Get.to(
              const InterfaceLogin(),
              transition: Transition.fadeIn,
              duration: Duration(milliseconds: 500),
            );
          },
          child: const Text(
            'login',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff4E71FF),
            ),
          ),
        )
      ],
    );
  }
}
