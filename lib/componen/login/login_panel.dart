import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/ctrl_login.dart';
import 'package:pusdatin_end/utils/validator.dart';
import 'package:pusdatin_end/widget/custombutton.dart';
import 'package:pusdatin_end/widget/customtxtfield.dart';
import 'package:pusdatin_end/widget/customtxtpass.dart';

class LoginPanel extends StatelessWidget {
  const LoginPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlLogin>();
    final _loginkey = GlobalKey<FormState>();

    void masuk() {
      if (!ctrl.isloading.value && _loginkey.currentState!.validate()) {
        ctrl.login(ctrl.emailctrl.text, ctrl.passctrl.text);
      }
    }

    return Form(
      key: _loginkey,
      child: Column(
        children: [
          CustomTxtField(
            controller: ctrl.emailctrl,
            label: 'Email',
            validator: emailValidator,
            keyboardtype: TextInputType.emailAddress,
            focusnode: ctrl.emailfocus,
            onfieldsubmitted: (_) {
              FocusScope.of(context).requestFocus(ctrl.passfocus);
            },
          ),
          const SizedBox(height: 20),
          CustomTxtPass(
            controller: ctrl.passctrl,
            label: 'Password',
            validator: passwordValidator,
            rxObscure: ctrl.isPassHidden,
            toggleObscure: ctrl.togglepass,
            focusnode: ctrl.passfocus,
            onfieldsubmitted: (_) {
              masuk();
            },
          ),
          const SizedBox(height: 20),
          Obx(() {
            return CustomButton(
              onpress: ctrl.isloading.value
                  ? () {}
                  : () {
                      masuk();
                    },
              txt: 'login',
              isloading: ctrl.isloading.value,
            );
          })
        ],
      ),
    );
  }
}
