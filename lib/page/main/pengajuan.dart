import 'package:flutter/material.dart';
import 'package:pusdatin_end/page/componen/historyform.dart.dart';
import 'package:pusdatin_end/page/componen/panelform.dart';
import 'package:pusdatin_end/widget/customappbar.dart';
import 'package:pusdatin_end/widget/custombutton.dart';

class PengajuanPage extends StatefulWidget {
  const PengajuanPage({super.key});

  @override
  State<PengajuanPage> createState() => PengajuanPageState();
}

class PengajuanPageState extends State<PengajuanPage> {
  final GlobalKey<PanelformState> _formKey = GlobalKey<PanelformState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Pengajuan',
        boldTitle: 'Barang',
        showNotif: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Panelform(key: _formKey,),
            const SizedBox(height: 20),
            Historyform()
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
        child: CustomButton(
          onpress: () {
            _formKey.currentState?.ajukan();
          },
          txt: 'kirim',
        ),
      ),
    );
  }
}
