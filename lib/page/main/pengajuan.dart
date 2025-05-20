import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:pusdatin_end/module/controller/ctrl_pengajuan.dart';
import 'package:pusdatin_end/page/main/componen/formhistory.dart';
import 'package:pusdatin_end/page/main/componen/formpanel.dart';
import 'package:pusdatin_end/widget/customappbar.dart';
import 'package:pusdatin_end/widget/custombutton.dart';

class PengajuanPage extends StatefulWidget {
  const PengajuanPage({super.key});

  @override
  State<PengajuanPage> createState() => PengajuanPageState();
}

class PengajuanPageState extends State<PengajuanPage> {
  final GlobalKey<FormPanelState> _formKey = GlobalKey<FormPanelState>();
  final ctrlpengajuan = Get.put(CtrlPengajuan());

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
            FormPanel(
              key: _formKey,
            ),
            const SizedBox(height: 20),
            FormHistory(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: 20,
          left: 15,
          right: 15,
          top: 5,
        ),
        child: Obx(() => CustomButton(
              onpress: ctrlpengajuan.isLoading.value
                  ? () {}
                  : () {
                      _formKey.currentState?.ajukan();
                    },
              txt: 'kirim',
              isloading: ctrlpengajuan.isLoading.value,
            )),
      ),
    );
  }
}
