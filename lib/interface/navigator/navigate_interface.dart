import 'package:flutter/material.dart';
import 'package:pusdatin_end/componen/navigator/bodypanel.dart';
import 'package:pusdatin_end/componen/navigator/bottompanel.dart';

class NavigateInterface extends StatelessWidget {
  const NavigateInterface({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyPanel(),
      bottomNavigationBar: BottomPanel(),
    );
  }
}
