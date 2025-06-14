import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/ctrl_persetujuan.dart';
import 'package:pusdatin_end/controller/ctrl_user.dart';
import 'package:pusdatin_end/utils/emptypage.dart';
import 'package:pusdatin_end/componen/card/formcarditem.dart';

class FormCardPanel extends StatelessWidget {
  final String selectedFilter;

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
      bool rolesesuai = true;
      bool filtersesuai = true;

      if (roleuser == 2) {
        rolesesuai = int.tryParse(item.idPengguna.toString()) == iduser;
      }

      if (selectedFilter != 'Semua') {
        filtersesuai = item.kode.toString().toLowerCase() == selectedFilter.toLowerCase();
      }

      if (rolesesuai && filtersesuai) {
        dataFiltered.add(item);
      }
    }
    if (dataFiltered.isEmpty) {
      return const EmptyPage(txt: 'Belum ada pengajuan');
    }
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: dataFiltered.length,
      separatorBuilder: (context, index) {
        return const SizedBox();
      },
      itemBuilder: (context, index) {
        final item = dataFiltered[index];
        return FormCardItem(
          item: item,
          roleuser: roleuser.toString(),
        );
      },
    );
  }
}
