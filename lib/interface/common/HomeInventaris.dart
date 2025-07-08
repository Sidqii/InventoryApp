import 'package:flutter/material.dart';
import 'package:pusdatin_end/interface/staff/InvenPanelStaff.dart';
import 'package:pusdatin_end/widget/customappbar.dart';

class HomeInventaris extends StatelessWidget {
  const HomeInventaris({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Data',
        boldTitle: 'Barang',
      ),
      body: const InvenPanelStaff(),
    );
  }
}
