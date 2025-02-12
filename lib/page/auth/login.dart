import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pusdatin_end/page/auth/register.dart';
import 'package:pusdatin_end/widget/custombutton.dart';
import 'package:pusdatin_end/widget/customtxtfield.dart';
import 'package:pusdatin_end/widget/validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailctrl = TextEditingController();
  final _passctrl = TextEditingController();
  final _emailfocus = FocusNode();
  final _passfocus = FocusNode();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                'Selamat\nDatang Kembali,\ndi AssetsHub.',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 10),
              CustomTxtField(
                controller: _passctrl,
                label: 'Password',
                validator: passwordValidator,
                keyboardtype: TextInputType.text,
                obscuretxt: true,
                focusnode: _passfocus,
                onfieldsubmitted: (_) {},
              ),
              const SizedBox(height: 35),
              CustomButton(
                onpress: () {},
                txt: 'Login',
              ),
              // ElevatedButton(
              //   onPressed: () {},
              //   child: Text('Login', style: TextStyle(color: Colors.white),),
              //   style: ElevatedButton.styleFrom(
              //     minimumSize: Size(double.infinity, 50),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     elevation: 10,
              //     shadowColor: Colors.black,
              //   ),
              // ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Don\'t have any account?',
                    style: GoogleFonts.poppins(),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign in!',
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 1),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ChenLong gak sekolah.'),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
