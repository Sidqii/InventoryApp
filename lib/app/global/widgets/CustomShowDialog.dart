import 'package:flutter/material.dart';

class CustomShowDialog extends StatelessWidget {
  final Widget child;
  final double? rounded;

  /// bisa pakai width fix (pixel)
  final double? width;

  /// bisa pakai height fix (pixel)
  final double? height;

  /// bisa pakai width factor (%)
  final double? widthFactor;

  /// bisa pakai height factor (%)
  final double? heightFactor;

  const CustomShowDialog({
    required this.child,
    this.rounded,
    this.width,
    this.height,
    this.widthFactor,
    this.heightFactor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    final dialogWidth = width ??
        (widthFactor != null ? media.width * widthFactor! : null);
    final dialogHeight = height ??
        (heightFactor != null ? media.height * heightFactor! : null);

    return Dialog(
      insetPadding: const EdgeInsets.all(5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(rounded ?? 5),
      ),
      child: SizedBox(
        width: dialogWidth,   // kalau null → auto fit child
        height: dialogHeight, // kalau null → auto fit child
        child: child,
      ),
    );
  }
}
