import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/ctrl_persetujuan.dart';
import 'package:pusdatin_end/controller/ctrl_user.dart';
import 'package:pusdatin_end/utils/emptypage.dart';
import 'package:pusdatin_end/componen/card/formcarditem.dart';

class FormCardPanel extends StatelessWidget {
  final int selectedFilter;

  const FormCardPanel({
    required this.selectedFilter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userctrl = Get.find<CtrlUser>().user.value!;
    final persetujuanctrl = Get.find<CtrlPersetujuan>();

    final int roleuser = userctrl.role ?? 0;
    final int iduser = userctrl.id;

    List<dynamic> dataFiltered = [];

    for (var item in persetujuanctrl.dataPengajuan) {

      bool roleid = true;
      bool filterid = true;

      if (roleuser == 2) {
        roleid = int.tryParse(item.isUser.toString()) == iduser;
      }

      if (selectedFilter != 0) {
        filterid = int.tryParse(item.idStat.toString()) == selectedFilter;
      }

      if (roleid && filterid) {
        dataFiltered.add(item);
      }
    }
    if (dataFiltered.isEmpty) {
      String ket = 'Belum ada pengajuan';

      if (selectedFilter == 1) {
        ket = 'Belum ada pengajuan barang';
      } else if (selectedFilter == 2) {
        ket = 'Belum ada pengajuan disetujui';
      } else if (selectedFilter == 3) {
        ket = 'Belum ada pengajuan ditolak';
      }
      return EmptyPage(txt: ket);
    }
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: dataFiltered.length,
      separatorBuilder: (context, index) {
        return const SizedBox();
      },
      itemBuilder: (AboutDialog, index) {
        final item = dataFiltered[index];
        return FormCardItem(
          item: item,
          roleuser: roleuser.toString(),
        );
      },
    );
  }
}
