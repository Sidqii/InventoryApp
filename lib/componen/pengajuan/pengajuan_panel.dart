import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/componen/pengajuan/paneldropdown.dart';
import 'package:pusdatin_end/componen/pengajuan/panelinstansi.dart';
import 'package:pusdatin_end/componen/pengajuan/paneljumlah.dart';
import 'package:pusdatin_end/componen/pengajuan/panelkeperluan.dart';
import 'package:pusdatin_end/componen/pengajuan/panelpeminjam.dart';
import 'package:pusdatin_end/componen/pengajuan/paneltanggal.dart';
import 'package:pusdatin_end/controller/ctrl_pengajuan.dart';
import 'package:pusdatin_end/widget/custompanel.dart';

class PengajuanPanel extends StatelessWidget {
  const PengajuanPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlPengajuan>();

    return CustomPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Informasi peminjam',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          const Row(
            children: [
              Expanded(child: PanelPeminjam()),
              SizedBox(width: 20),
              Expanded(child: PanelInstansi()),
            ],
          ),
          const SizedBox(height: 10),
          const PanelKeperluan(),
          const SizedBox(height: 40),
          const Text(
            'Detail barang',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const Row(
            children: [
              Expanded(child: PanelDropdown()),
              SizedBox(width: 20),
              Expanded(child: PanelJumlah()),
            ],
          ),
          const SizedBox(height: 10),
          PanelTanggal(
            onSubmit: () {
              ctrl.ajukan();
            },
          ),
        ],
      ),
    );
  }
}
