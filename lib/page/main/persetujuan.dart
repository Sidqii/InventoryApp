import 'package:flutter/material.dart';
import 'package:pusdatin_end/widget/customappbar.dart';

class PersetujuanPage extends StatefulWidget {
  const PersetujuanPage({super.key});

  @override
  State<PersetujuanPage> createState() => _PersetujuanState();
}

class _PersetujuanState extends State<PersetujuanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Penel',
        boldTitle: 'Persetujuan',
        showNotif: false,
      ),
      body: const Center(
        child: Text('Hello from Persetujuan'),
      ),
    );
  }
}
