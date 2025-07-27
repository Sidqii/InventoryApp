import 'package:flutter/material.dart';
import 'package:pusdatin_end/model/app_riwayat.dart';

class ReturnDataOperator extends StatelessWidget {
  final AppRiwayatModel model;

  const ReturnDataOperator({
    required this.model,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [],
              ),
              Row(
                children: [],
              ),
              Row(
                children: [],
              ),
              Row(
                children: [],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
