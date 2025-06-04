import 'package:flutter/material.dart';
import 'package:pusdatin_end/componen/pengajuan/paneldropdown.dart';
import 'package:pusdatin_end/componen/pengajuan/panelinstansi.dart';
import 'package:pusdatin_end/componen/pengajuan/paneljumlah.dart';
import 'package:pusdatin_end/componen/pengajuan/panelkeperluan.dart';
import 'package:pusdatin_end/componen/pengajuan/panelpeminjam.dart';
import 'package:pusdatin_end/componen/pengajuan/paneltanggal.dart';
import 'package:pusdatin_end/widget/custompanel.dart';

class PengajuanPanel extends StatelessWidget {
  const PengajuanPanel({super.key});

  @override
  Widget build(BuildContext context) {

    return CustomPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Informasi peminjam',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: PanelPeminjam()),
              SizedBox(width: 20),
              Expanded(child: PanelInstansi()),
            ],
          ),
          SizedBox(height: 10),
          PanelKeperluan(),
          SizedBox(height: 40),
          Text(
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
              Expanded(child: PanelJumlah()),
            ],
          ),
          SizedBox(height: 10),
          PanelTanggal(),
        ],
      ),
    );
  }
}
