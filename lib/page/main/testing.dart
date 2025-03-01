import 'package:flutter/material.dart';
import 'package:pusdatin_end/widget/customdialog.dart';

class TestingPage extends StatelessWidget {
  const TestingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Testing Custom Dialog")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            CustomDialog.show(
              isSuccess: true,
              duration: Duration(seconds: 2)
            );
          },
          child: Text("Tampilkan Dialog"),
        ),
      ),
    );
  }
}
