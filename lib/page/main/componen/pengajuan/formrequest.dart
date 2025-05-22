import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/module/controller/ctrl_panel.dart';
import 'package:pusdatin_end/module/controller/ctrl_user.dart';
import 'package:pusdatin_end/page/main/componen/pengajuan/paneldropdown.dart';
import 'package:pusdatin_end/page/main/componen/pengajuan/panelinstansi.dart';
import 'package:pusdatin_end/page/main/componen/pengajuan/paneljumlah.dart';
import 'package:pusdatin_end/page/main/componen/pengajuan/panelkeperluan.dart';
import 'package:pusdatin_end/page/main/componen/pengajuan/panelpeminjam.dart';
import 'package:pusdatin_end/page/main/componen/pengajuan/paneltanggal.dart';

class FormRequest extends StatefulWidget {
  const FormRequest({super.key});

  @override
  State<FormRequest> createState() => _FormRequestState();
}

class _FormRequestState extends State<FormRequest> {
  final panelctrl = Get.find<CtrlPanel>();
  final userctrl = Get.find<CtrlUser>();

  void initState() {
    super.initState();
    panelctrl.loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: 40,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(4, 4),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Informasi Peminjam:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: PanelPeminjam(),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: PanelInstansi(),
              ),
            ],
          ),
          const SizedBox(height: 10),
          PanelKeperluan(),
          const SizedBox(height: 40),
          const Text(
            'Detail Barang:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Row(
            children: [
              Expanded(
                child: PanelDropdown(),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: PanelJumlah(),
              ),
            ],
          ),
          const SizedBox(height: 10),
          PanelTanggal(),
        ],
      ),
    );
  }
}
