import 'package:flutter/material.dart';
import 'package:pusdatin_end/interface/operator/02_OperatorPanel.dart';
import 'package:pusdatin_end/widget/customappbar.dart';

class HomeOperator extends StatelessWidget {
  const HomeOperator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Pengajuan',
        boldTitle: 'Barang',
        showNotif: true,
      ),
      body: const OperatorPanel(),
    );
  }
}
