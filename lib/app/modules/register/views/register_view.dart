import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inven/app/modules/register/views/register_panel.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: RegisterPanel());
  }
}
