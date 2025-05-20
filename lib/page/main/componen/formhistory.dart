import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/module/controller/ctrl_persetujuan.dart';
import 'package:pusdatin_end/module/controller/ctrl_user.dart';
import 'package:pusdatin_end/page/main/componen/historycarditem.dart';
import 'package:pusdatin_end/utils/formattter.dart';

class FormHistory extends StatefulWidget {
  const FormHistory({super.key});

  @override
  State<FormHistory> createState() => _FormHistoryState();
}

class _FormHistoryState extends State<FormHistory> {
  final ctrlpersetujuan = Get.find<CtrlPersetujuan>();
  final ctrluser = Get.find<CtrlUser>().user.value;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: ctrlpersetujuan.dataPengajuan.length,
      itemBuilder: (context, index) {
        final item = ctrlpersetujuan.dataPengajuan[index];

        return HistoryCardItem(
          item: item,
          roleuser: getRole(ctrluser?.role ?? 0),
        );
      },
    );
  }
}
