import 'package:flutter/material.dart';
import 'package:pusdatin_end/interface/staff/formriwayat/FormCardRiwayatBody.dart';
import 'package:pusdatin_end/interface/staff/formriwayat/FormCardRiwayatHeader.dart';
import 'package:pusdatin_end/model/app_riwayat.dart';
import 'package:pusdatin_end/widget/PanelItem.dart';

class FormCardRiwayatStaff extends StatelessWidget {
  final AppRiwayatModel item;

  const FormCardRiwayatStaff({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ItemPanel(
      header: FormCardHeaderStaff(item: item),
      body: FormCardBodyStaff(item: item),
    );
  }
}
