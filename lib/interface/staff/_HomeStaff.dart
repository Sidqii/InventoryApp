import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/staff/CtrlPengajuan.dart';
import 'package:pusdatin_end/interface/staff/panel/PanelPengajuan.dart';
import 'package:pusdatin_end/interface/staff/StaffPanel.dart';
import 'package:pusdatin_end/widget/customappbar.dart';
import 'package:pusdatin_end/widget/custombutton.dart';

class HomeStaff extends StatelessWidget {
  const HomeStaff({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlPengajuan>();

    return Scaffold(
      appBar: CustomAppbar(
        title: 'Pengajuan',
        boldTitle: 'Barang',
        showNotif: false,
      ),
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.only(
            top: 15,
            right: 10,
            left: 10,
            bottom: 10,
          ),
          child: Form(
            key: ctrl.formkey,
            child: Column(
              children: const [
                PanelPengajuan(),
                SizedBox(height: 20),
                StaffPanel(),
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
