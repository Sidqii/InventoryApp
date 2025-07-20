import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/staff/CtrlPengajuan.dart';
import 'package:pusdatin_end/interface/staff/panel/PanelDropdown.dart';
import 'package:pusdatin_end/interface/staff/panel/PanelInstansi.dart';
import 'package:pusdatin_end/interface/staff/panel/PanelJumlah.dart';
import 'package:pusdatin_end/interface/staff/panel/PanelKeperluan.dart';
import 'package:pusdatin_end/interface/staff/panel/PanelPeminjam.dart';
import 'package:pusdatin_end/interface/staff/panel/PanelTanggal.dart';
import 'package:pusdatin_end/widget/panelBackground.dart';

class PanelPengajuan extends StatelessWidget {
  const PanelPengajuan({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlPengajuan>();

    return BackgroundPanel(
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
          Row(
            children: [
              Expanded(child: PanelDropdown()),
              SizedBox(width: 20),
              Expanded(
                child: PanelTanggal(
                  onSubmit: () {
                    ctrl.ajukan();
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const PanelJumlah()
        ],
      ),
    );
  }
}
