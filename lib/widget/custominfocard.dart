import 'package:flutter/material.dart';
import 'package:pusdatin_end/utils/formattter.dart';

class CustomInfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Map<String, dynamic> details;
  final List<String> currencyField;
  final Color? titleColor;
  final Color? subtitleColor;
  final double? elevation;

  const CustomInfoCard({
    required this.title,
    required this.subtitle,
    required this.details,
    this.currencyField = const [],
    this.titleColor,
    this.subtitleColor,
    this.elevation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: elevation ?? 3,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: titleColor ?? Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: subtitleColor ?? Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7),
            // for (var entry in details.entries)
            ...details.entries.map((entry) {
              final isCurrency = currencyField.contains(entry.key);
              final value = formatValue(entry.value, isCurrency: isCurrency);

              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.key,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      value,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
