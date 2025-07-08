import 'package:flutter/material.dart';
import 'package:pusdatin_end/interface/common/NavBody.dart';
import 'package:pusdatin_end/interface/common/NavBttm.dart';

class NavPage extends StatelessWidget {
  const NavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NavBody(),
      bottomNavigationBar: NavBttm(),
    );
  }
}
