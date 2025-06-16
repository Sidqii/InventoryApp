import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/componen/pengajuan/pengajuan_panel.dart';
import 'package:pusdatin_end/componen/userinterface/role2panel.dart';
import 'package:pusdatin_end/controller/ctrl_pengajuan.dart';
import 'package:pusdatin_end/widget/customappbar.dart';
import 'package:pusdatin_end/widget/custombutton.dart';

class InterfaceStaff extends StatelessWidget {
  const InterfaceStaff({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlPengajuan>();

    return Scaffold(
      appBar: CustomAppbar(
        title: 'Pengajuan',
        boldTitle: 'Barang',
        showNotif: false,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ctrl.refresh();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(10),
          child: Form(
            key: ctrl.formkey,
            child: Column(
              children: const [
                PengajuanPanel(),
                SizedBox(height: 20),
                Role2Panel(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          top: 5,
          left: 15,
          right: 15,
          bottom: 15,
        ),
        child: Obx(() {
          return CustomButton(
            onpress: ctrl.isLoading.value
                ? () {}
                : () {
                    ctrl.ajukan();
                  },
            txt: 'kirim',
            isloading: ctrl.isLoading.value,
          );
        }),
      ),
    );
  }
}
