import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:inven/app/global/utils/Formatter.dart';

class CustomDatePicker extends StatelessWidget {
  final String label;
  final DateTime slctDate;
  final Function(DateTime) onDatePick;

  const CustomDatePicker({
    required this.label,
    required this.slctDate,
    required this.onDatePick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = const TextStyle(fontSize: 13);
    // final bold = const TextStyle(fontWeight: FontWeight.bold);
    final impl = const TextStyle(fontSize: 14, color: Colors.white);

    return GestureDetector(
      onTap: () async {
        DateTime? pick = await showDatePicker(
          context: context,
          initialDate: slctDate,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                  onSurface: Colors.black,
                ),
              ),
              child: child!,
            );
          },
        );

        if (pick == null) {
          return;
        }

        if (pick.isBefore(DateTime.now())) {
          Get.snackbar('Gagal', 'Tanggal pengembalian tidak valid');
        }

        onDatePick(pick);
      },

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(child: Text(label, style: size)),

          const SizedBox(height: 5),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              border: Border.all(color: Colors.grey.shade900),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              Formatter.dateID(slctDate.toIso8601String()),
              style: impl,
            ),
          ),
        ],
      ),
    );
  }
}
