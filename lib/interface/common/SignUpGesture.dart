import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/common/CtrlSignUp.dart';
import 'package:pusdatin_end/interface/common/HomeSignIn.dart';

class SignupGesture extends StatelessWidget {
  const SignupGesture({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlSignup>();

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
              const HomeSignin(),
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
