import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:pusdatin_end/module/controller/ctrl_panel.dart';
import 'package:pusdatin_end/module/controller/ctrl_user.dart';
import 'package:pusdatin_end/page/main/componen/formhistory.dart';
import 'package:pusdatin_end/page/main/componen/formrequest.dart';
import 'package:pusdatin_end/widget/customappbar.dart';
import 'package:pusdatin_end/widget/custombutton.dart';

class PengajuanPage extends StatefulWidget {
  const PengajuanPage({super.key});

  @override
  State<PengajuanPage> createState() => PengajuanPageState();
}

class PengajuanPageState extends State<PengajuanPage> {
  final ctrlpanel = Get.find<CtrlPanel>();
  final ctrluser = Get.find<CtrlUser>().user.value!;

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
        child: Form(
          key: ctrlpanel.formkey,
          child: Column(
            children: [
              FormRequest(),
              const SizedBox(height: 10),
              FormHistory(),
            ],
          ),
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
              onpress: ctrlpanel.isLoading.value
                  ? () {}
                  : () {
                      ctrlpanel.ajukan(ctrluser.id);
                    },
              txt: 'kirim',
              isloading: ctrlpanel.isLoading.value,
            )),
      ),
    );
  }
}
