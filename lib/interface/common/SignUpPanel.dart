import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:pusdatin_end/controller/common/CtrlSignUp.dart';
import 'package:pusdatin_end/utils/Validator.dart';
import 'package:pusdatin_end/widget/custombutton.dart';
import 'package:pusdatin_end/widget/customtxtfield.dart';
import 'package:pusdatin_end/widget/customtxtpass.dart';

class SignupPanel extends StatelessWidget {
  const SignupPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlSignup>();
    final _regiskey = GlobalKey<FormState>();

    return Form(
      key: _regiskey,
      child: Column(
        children: [
          CustomTxtField(
            controller: ctrl.emailctrl,
            label: 'Email',
            validator: emailValidator,
            keyboardtype: TextInputType.text,
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
              FocusScope.of(context).requestFocus(ctrl.confirmfocus);
            },
          ),
          const SizedBox(height: 20),
          CustomTxtPass(
            controller: ctrl.confirmctrl,
            label: 'Confirm password',
            validator: (value) {
              if (value != ctrl.passctrl.text) {
                return 'Password tidak sesuai';
              }
              return null;
            },
            rxObscure: ctrl.isPassHidden,
            toggleObscure: ctrl.togglepass,
            focusnode: ctrl.confirmfocus,
            onfieldsubmitted: (_) {
              if (_regiskey.currentState!.validate()) {
                ctrl.register(ctrl.emailctrl.text, ctrl.passctrl.text);
              }
            },
          ),
          const SizedBox(height: 35),
          Obx(() {
            return CustomButton(
              onpress: ctrl.isLoading.value
                  ? () {}
                  : () {
                      if (_regiskey.currentState!.validate()) {
                        ctrl.register(ctrl.emailctrl.text, ctrl.passctrl.text);
                      }
                    },
              txt: 'register',
              isloading: ctrl.isLoading.value,
            );
          })
        ],
      ),
    );
  }
}
