import 'package:flutter/material.dart';
import 'package:pusdatin_end/componen/inventaris/invenpanel.dart';
import 'package:pusdatin_end/widget/customappbar.dart';

class InterfaceInven extends StatelessWidget {
  const InterfaceInven({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Data',
        boldTitle: 'Barang',
      ),
      body: const Invenpanel(),
    );
  }
}
