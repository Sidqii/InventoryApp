import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:inven/app/global/utils/Validator.dart';
import 'package:inven/app/global/widgets/CustomBtnForm.dart';
import 'package:inven/app/global/widgets/CustomTxtForm.dart';
import 'package:inven/app/global/widgets/CustomTxtPass.dart';
import 'package:inven/app/modules/login/controllers/login_controller.dart';

class LoginCtrl extends GetView<LoginController> {
  const LoginCtrl({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.loginKey,
      child: Column(
        children: [
          CustomTxtForm(
            Label: 'Email',
            Controller: controller.ctrlEmail,
            Focus: controller.fcsEmail,
            Validator: Validator().emailValidator,
            OnSubmit: (_) {
              FocusScope.of(context).requestFocus(controller.fcsPass);
            },
          ),
          const SizedBox(height: 20),
          CustomTxtPass(
            Label: 'Password',
            Controller: controller.ctrlPass,
            Focus: controller.fcsPass,
            isHidden: controller.isPassHide,
            ToggleHide: controller.toglePass,
            Validator: Validator().passwordValidator,
            OnSubmit: (_) {
              controller.login();
            },
          ),
          const SizedBox(height: 20),
          Obx(() {
            return CustomBtnForm(
              Label: 'masuk',
              isLoading: controller.isLoading.value,
              OnPress: controller.isLoading.value
                  ? () {}
                  : () {
                      controller.login();
                    },
            );
          }),
        ],
      ),
    );
  }
}
