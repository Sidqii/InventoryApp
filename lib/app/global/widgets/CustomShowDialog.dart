import 'package:flutter/material.dart';

class CustomShowDialog extends StatelessWidget {
  final Widget child;
  final double widthFactor;
  final double? heightFactor;

  const CustomShowDialog({
    required this.child,
    this.widthFactor = 0.95,
    this.heightFactor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * widthFactor,
        height: MediaQuery.of(context).size.height * (heightFactor ?? 0.55),
        child: child,
      ),
    );
  }
}
