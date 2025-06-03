import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:pusdatin_end/controller/ctrl_register.dart';
import 'package:pusdatin_end/utils/validator.dart';
import 'package:pusdatin_end/widget/custombutton.dart';
import 'package:pusdatin_end/widget/customtxtfield.dart';

class RegisPanel extends StatelessWidget {
  const RegisPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlRegister>();
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
            obscuretxt: false,
            focusnode: ctrl.emailfocus,
            onfieldsubmitted: (_) {
              FocusScope.of(context).requestFocus(ctrl.passfocus);
            },
          ),
          const SizedBox(height: 20),
          CustomTxtField(
            controller: ctrl.passctrl,
            label: 'Password',
            validator: passwordValidator,
            keyboardtype: TextInputType.text,
            obscuretxt: true,
            focusnode: ctrl.passfocus,
            onfieldsubmitted: (_) {
              FocusScope.of(context).requestFocus(ctrl.confirmfocus);
            },
          ),
          const SizedBox(height: 20),
          CustomTxtField(
            controller: ctrl.confirmctrl,
            label: 'Confirm password',
            validator: (value) {
              if (value != ctrl.passctrl.text) {
                return 'Password tidak sesuai';
              }
              return null;
            },
            keyboardtype: TextInputType.text,
            obscuretxt: true,
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
