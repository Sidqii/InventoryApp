import 'package:flutter/material.dart';
import 'package:pusdatin_end/componen/register/regis_gesture.dart';
import 'package:pusdatin_end/componen/register/regis_panel.dart';

class InterfaceRegis extends StatelessWidget {
  const InterfaceRegis({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Silahkan lakukan\nregistrasi',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 35),
                        RegisPanel(),
                        SizedBox(height: 40),
                        RegisGesture()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
