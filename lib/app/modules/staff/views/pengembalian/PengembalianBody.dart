import 'package:flutter/material.dart';
import 'package:inven/app/data/models/AppPengembalian.dart';
import 'package:inven/app/modules/staff/views/pengembalian/PengembalianData.dart';

class PengembalianBody extends StatelessWidget {
  final AppPengembalian model;

  const PengembalianBody({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
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
            child: PengembalianData(model: model),
          ),
        ],
      ),
    );
  }
}
