import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/common/CtrlRiwayat.dart';
import 'package:pusdatin_end/controller/common/CtrlUser.dart';
import 'package:pusdatin_end/interface/staff/formriwayat/FormCardRiwayatPanel.dart';
import 'package:pusdatin_end/utils/EmptyPageStaff.dart';

class FormcardPanelStaff extends StatelessWidget {
  final int slcfltr;

  const FormcardPanelStaff({
    required this.slcfltr,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlRiwayat>();
    final user = Get.find<CtrlUser>().user.value!.id;

    List<dynamic> fltrdata = [];

    for (var i in ctrl.riwayat) {
      bool roleid = i.user == user;
      bool fltrid = true;

      if (slcfltr != 0) {
        fltrid = int.tryParse(i.status.toString()) == slcfltr;
      }

      if (roleid && fltrid) {
        fltrdata.add(i);
      }
    }

    if (fltrdata.isEmpty) {
      String ket;

      switch (slcfltr) {
        case 1:
          ket = 'Belum ada pengajuan barang';
          break;
        case 2:
          ket = 'Belum ada pengajuan di setujui';
          break;
        case 3:
          ket = 'Belum ada pengajuan di tolak';
          break;
        default:
          ket = 'Belum ada pengajuan';
      }
      return EmptyPageStaff(txt: ket);
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: fltrdata.length,
      separatorBuilder: (context, index) {
        return const SizedBox();
      },
      itemBuilder: (AboutDialog, index) {
        final item = fltrdata[index];
        return FormCardRiwayatStaff(item: item);
      },
    );
  }
}
