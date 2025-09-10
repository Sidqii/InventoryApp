import 'package:flutter/cupertino.dart';
import 'package:inven/app/global/widgets/CustomAppBar.dart';

class PersetujuanPanel extends StatelessWidget {
  const PersetujuanPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppbar(title: 'Proses', boldTitle: 'Pengajuan', showNotif: false),
      ],
    );
  }
}
