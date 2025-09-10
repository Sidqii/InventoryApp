import 'package:flutter/cupertino.dart';
import 'package:inven/app/global/widgets/CustomAppBar.dart';

class PemrosesanPanel extends StatelessWidget {
  const PemrosesanPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppbar(
          title: 'Proses',
          boldTitle: 'Pengembalian',
          showNotif: false,
        ),
      ],
    );
  }
}
