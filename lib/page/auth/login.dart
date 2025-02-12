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
                onpress: () {
                  print('Login');
                },
                txt: 'Login',
              ),
              const SizedBox(height: 40),
              Row(
                spacing: 3,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Belum punya akun?',
                    style: GoogleFonts.poppins(),
                  ),
                  // const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ),
                      );
                    },
                    child: Row(
                      spacing: 2,
                      children: [
                        Text(
                          'Daftar',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        Text('!'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 130),
              Center(
                child: Column(
                  spacing: 5,
                  children: [
                    Text('Atau daftar melalui'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 15,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.facebook_sharp,
                            size: 35,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.telegram_sharp,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
