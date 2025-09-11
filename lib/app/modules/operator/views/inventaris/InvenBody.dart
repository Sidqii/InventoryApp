import 'package:flutter/material.dart';
import 'package:inven/app/data/models/AppBarang.dart';
import 'package:inven/app/modules/operator/views/inventaris/InvenData.dart';

class InvenBody extends StatelessWidget {
  final AppBarang model;

  const InvenBody({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0xffF4F7F7),
              borderRadius: BorderRadius.circular(5),
            ),
            child: InvenData(model: model),
          ),
        ],
      ),
    );
  }
}
