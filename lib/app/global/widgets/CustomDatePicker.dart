import 'package:flutter/material.dart';
import 'package:inven/app/global/utils/Formatter.dart';

class CustomDatePicker extends StatelessWidget {
  final String label;
  final DateTime? selectDate;
  final Function(DateTime) onDatePick;

  const CustomDatePicker({
    required this.label,
    required this.selectDate,
    required this.onDatePick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = const TextStyle(fontSize: 13);
    final impl = const TextStyle(fontSize: 13, color: Colors.white);

    return GestureDetector(
      onTap: () async {
        DateTime initial = selectDate ?? DateTime.now();

        DateTime? pick = await showDatePicker(
          context: context,
          initialDate: initial,
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

        if (pick == null) return;

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
              selectDate != null
                  ? Formatter.dateID(selectDate!.toIso8601String())
                  : 'Pilih tanggal',
              style: impl,
            ),
          ),
        ],
      ),
    );
  }
}
