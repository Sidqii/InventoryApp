import 'package:flutter/material.dart';
import 'package:pusdatin_end/componen/riwayat/formhistorylogic.dart';

class SetujuPanel extends StatelessWidget {
  final String selectedFilter;

  const SetujuPanel({
    required this.selectedFilter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return formHistoryLogic(selectedFilter: selectedFilter);
  }
}
