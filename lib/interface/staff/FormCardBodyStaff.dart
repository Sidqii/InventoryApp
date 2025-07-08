import 'package:flutter/material.dart';
import 'package:pusdatin_end/model/app_riawayat.dart';

class FormCardBodyStaff extends StatelessWidget {
  final RiwayatModel item;
  const FormCardBodyStaff({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xffF4F7F7),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Keperluan:',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                item.hal,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
