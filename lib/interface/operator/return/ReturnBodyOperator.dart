import 'package:flutter/material.dart';
import 'package:pusdatin_end/interface/operator/return/ReturnDataOperator.dart';
import 'package:pusdatin_end/model/app_riwayat.dart';

class ReturnBodyOperator extends StatelessWidget {
  final AppRiwayatModel model;

  const ReturnBodyOperator({
    required this.model,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0xffF4F7F7),
              borderRadius: BorderRadius.circular(5),
            ),
            child: ReturnDataOperator(model: model),
          ),
        ],
      ),
    );
  }
}
