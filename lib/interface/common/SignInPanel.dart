import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/common/CtrlSignIn.dart';
import 'package:pusdatin_end/utils/Validator.dart';
import 'package:pusdatin_end/widget/custombutton.dart';
import 'package:pusdatin_end/widget/customtxtfield.dart';
import 'package:pusdatin_end/widget/customtxtpass.dart';

class SigninPanel extends StatelessWidget {
  const SigninPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlSignin>();
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
