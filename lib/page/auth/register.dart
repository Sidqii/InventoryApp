import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/page/auth/authlog.dart';
import 'package:pusdatin_end/widget/custombutton.dart';
import 'package:pusdatin_end/widget/customtxtfield.dart';
import 'package:pusdatin_end/widget/validator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailctrl = TextEditingController();
  final _passctrl = TextEditingController();
  final _confirmctrl = TextEditingController();
  final _emailfocus = FocusNode();
  final _passfocus = FocusNode();
  final _confirmfocus = FocusNode();
  final _formkey = GlobalKey<FormState>();

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
                Text(
                  'Silahkan\nLakukan Registrasi.',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 35),
                CustomTxtField(
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
                CustomTxtField(
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
                CustomTxtField(
                  controller: _confirmctrl,
                  label: 'Confirm Password',
                  validator: (value) {
                    if (value != _passctrl) {
                      return 'Password ambigu';
                    }
                    return null;
                  },
                  keyboardtype: TextInputType.text,
                  obscuretxt: true,
                  focusnode: _confirmfocus,
                  onfieldsubmitted: (_) {},
                ),
                const SizedBox(height: 40),
                CustomButton(
                  onpress: () {
                    print('Login');
                  },
                  txt: 'Register',
                ),
                const SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // spacing: 3,
                  children: [
                    Text('Sudah punya akun?'),
                    const SizedBox(width: 3),
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          AuthLog(),
                          transition: Transition.fadeIn,
                          duration: Duration(milliseconds: 550)
                        );
                      },
                      child: Text(
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
