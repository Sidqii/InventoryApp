import 'package:flutter/material.dart';
import 'package:pusdatin_end/interface/staff/fromapprve/CardApprvBody.dart';
import 'package:pusdatin_end/interface/staff/fromapprve/CardApprvHeader.dart';
import 'package:pusdatin_end/model/app_persetujuan.dart';
import 'package:pusdatin_end/widget/PanelItem.dart';

class FormCardApprvStaff extends StatelessWidget {
  final AppPersetujuanModel apprv;

  const FormCardApprvStaff({
    required this.apprv,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ItemPanel(
      header: CardApprvHeader(apprv: apprv),
      body: CardApprvBody(apprv: apprv),
    );
  }
}
