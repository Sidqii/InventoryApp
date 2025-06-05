import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/ctrl_register.dart';
import 'package:pusdatin_end/interface/auth/interface_login.dart';
import 'package:pusdatin_end/widget/custombutton.dart';
import 'package:pusdatin_end/widget/customtxt.dart';
import 'package:pusdatin_end/utils/validator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final ctrlRegister = Get.put(CtrlRegister());
  final _emailctrl = TextEditingController();
  final _passctrl = TextEditingController();
  final _confirmctrl = TextEditingController();
  final _emailfocus = FocusNode();
  final _passfocus = FocusNode();
  final _confirmfocus = FocusNode();
  final _formkey = GlobalKey<FormState>();

  void _register() {
    if (_formkey.currentState!.validate()) {
      ctrlRegister.register(_emailctrl.text, _passctrl.text).then((success) {
        if (success) {
          _emailctrl.clear();
          _passctrl.clear();
          _confirmctrl.clear();
          Get.to(
            InterfaceLogin(),
            transition: Transition.fadeIn,
            duration: Duration(milliseconds: 800),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                const Text(
                  'Silahkan\nLakukan Registrasi.',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 35),
                Customtxt(
                  controller: _emailctrl,
                  label: 'Email',
                  validator: emailValidator,
                  keyboardtype: TextInputType.emailAddress,
                  obscuretxt: false,
                  focusnode: _emailfocus,
                  onfieldsubmitted: (_) {
                    FocusScope.of(context).requestFocus(_passfocus);
                  },
                ),
                const SizedBox(height: 25),
                Customtxt(
                  controller: _passctrl,
                  label: 'Password',
                  validator: passwordValidator,
                  keyboardtype: TextInputType.text,
                  obscuretxt: true,
                  focusnode: _passfocus,
                  onfieldsubmitted: (_) {
                    FocusScope.of(context).requestFocus(_confirmfocus);
                  },
                ),
                const SizedBox(height: 25),
                Customtxt(
                  controller: _confirmctrl,
                  label: 'Konfirmasi Password',
                  validator: (value) {
                    if (value != _passctrl.text) {
                      return 'Password tidak sesuai';
                    }
                    return null;
                  },
                  keyboardtype: TextInputType.text,
                  obscuretxt: true,
                  focusnode: _confirmfocus,
                  onfieldsubmitted: (_) {
                    if (_formkey.currentState!.validate()) {
                      _register();
                    }
                  },
                ),
                const SizedBox(height: 40),
                Obx(() => CustomButton(
                      onpress: ctrlRegister.isLoading.value ? () {} : _register,
                      txt: 'register',
                      isloading: ctrlRegister.isLoading.value,
                    )),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Sudah punya akun?'),
                    const SizedBox(width: 3),
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          InterfaceLogin(),
                          transition: Transition.fadeIn,
                          duration: Duration(milliseconds: 550),
                        );
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
