import 'package:flutter/material.dart';
import 'package:inven/app/global/widgets/CustomAppBar.dart';
import 'package:inven/app/modules/operator/views/inventaris/InvenPanel.dart';

class OperatorInvenView extends StatelessWidget {
  const OperatorInvenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppbar(title: 'Inventaris', boldTitle: 'Barang'),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(0.5),
            child: InvenPanel(),
          ),
        ),
      ],
    );
  }
}
