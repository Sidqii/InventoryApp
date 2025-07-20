import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/common/CtrlRiwayat.dart';
import 'package:pusdatin_end/controller/common/CtrlUser.dart';
import 'package:pusdatin_end/interface/staff/fromapprve/CardApprvPanel.dart';
import 'package:pusdatin_end/model/app_persetujuan.dart';
import 'package:pusdatin_end/model/app_riwayat.dart';
import 'package:pusdatin_end/utils/EmptyPageStaff.dart';
import 'package:pusdatin_end/interface/staff/formriwayat/CardRiwayatPanel.dart';

class FormCardPanelStaff extends StatelessWidget {
  final int slcfltr;

  const FormCardPanelStaff({
    required this.slcfltr,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlRiwayat>();
    final user = Get.find<CtrlUser>().user.value!;

    final int id = user.id;

    List<dynamic> mixxdata = [
      ...ctrl.riwayat,
      ...ctrl.approve,
    ];

    List<dynamic> filtdata = [];

    for (var item in mixxdata) {
      bool roleid = false;
      bool status = false;

      //pengajuan model
      if (item is AppRiwayatModel) {
        roleid = item.user == id;

        if (slcfltr == 0) {
          status = true;
        } else {
          status = item.status == slcfltr;
        }
      }

      //persetujuan model
      if (item is AppPersetujuanModel) {
        print('modelpeminjam id: ${item.modelpeminjam?.id}');
        print('modeluser id (operator): ${item.modeluser?.id}');
        print('user login id: $id');
        print('statusbaru: ${item.statusbaru}');

        roleid = item.modelpeminjam?.id == id;

        if (slcfltr == 0) {
          status = true;
        } else {
          status = item.statusbaru == slcfltr;
        }
      }

      //data didalam filtdata
      if (roleid && status) {
        filtdata.add(item);
      }
    }

    if (filtdata.isEmpty) {
      String ket = 'Belum ada pengajuan';

      if (slcfltr == 1) {
        ket = 'Belum ada pengajuan barang';
      } else if (slcfltr == 2) {
        ket = 'Belum ada pengajuan disetujui';
      } else if (slcfltr == 3) {
        ket = 'Belum ada pengajuan ditolak';
      }
      return EmptyPageStaff(txt: ket);
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filtdata.length,
      separatorBuilder: (context, index) {
        return const SizedBox();
      },
      itemBuilder: (context, index) {
        final item = filtdata[index];

        if (item is AppRiwayatModel) {
          return FormCardRiwayatStaff(
            item: item,
          );
        } else if (item is AppPersetujuanModel) {
          return FormCardApprvStaff(
            apprv: item,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
