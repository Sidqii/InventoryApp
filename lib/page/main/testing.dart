import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/module/controller/ctrl_login.dart';

class Testing extends StatelessWidget {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final authC = Get.put(CtrlLogin());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailCtrl,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passCtrl,
              obscureText: false,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            Obx(() => authC.isloading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      authC.login(_emailCtrl.text, _passCtrl.text);
                    },
                    child: Text('Login'),
                  )),
          ],
        ),
      ),
    );
  }
}
