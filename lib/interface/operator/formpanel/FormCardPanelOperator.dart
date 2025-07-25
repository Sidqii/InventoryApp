import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/common/CtrlRiwayat.dart';
import 'package:pusdatin_end/interface/operator/formpanel/FormCardItemOperator.dart';
import 'package:pusdatin_end/utils/EmptyPageOperator.dart';

class FormCardPanelOperator extends StatelessWidget {
  final int selectedFilter;

  const FormCardPanelOperator({
    required this.selectedFilter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final history = Get.find<CtrlRiwayat>();

    List<dynamic> dataFiltered = [];

    for (var item in history.riwayat) {

      bool roleid = true;
      bool filterid = true;

      if (selectedFilter != 0) {
        filterid = int.tryParse(item.status.toString()) == selectedFilter;
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
      return EmptyPageOperator(txt: ket);
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
        return FormCardItemOperator(
          item: item,
        );
      },
    );
  }
}
