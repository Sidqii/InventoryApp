import 'package:flutter/material.dart';
import 'package:inven/app/modules/login/views/loginCtrl.dart';
import 'package:inven/app/modules/login/views/loginToRegis.dart';

class LoginView extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.3),

              Text(
                'Selamat\nDatang Kembali',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 30),

              Form(
                key: formKey,
                child: LoginCtrl(formKey: formKey),
              ),

              const SizedBox(height: 40),

              LoginToRegis(),
            ],
          ),
        ),
      ),
    );
  }
}
