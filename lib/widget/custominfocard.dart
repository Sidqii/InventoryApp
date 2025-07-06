import 'package:flutter/material.dart';

class CustomInfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Map<String, dynamic> details;
  final Color? titleColor;
  final Color? subtitleColor;
  final double? elevation;

  const CustomInfoCard({
    required this.title,
    required this.subtitle,
    required this.details,
    this.titleColor,
    this.subtitleColor,
    this.elevation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
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
            Divider(color: Colors.grey.shade400),
            ...details.entries.map((entry) {
              final value = entry.value.toString();

              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.key,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5
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
