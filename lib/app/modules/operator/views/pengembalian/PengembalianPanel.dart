import 'package:flutter/cupertino.dart';
import 'package:inven/app/global/widgets/CustomAppBar.dart';

class PengembalianPanel extends StatelessWidget {
  const PengembalianPanel({super.key});

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
