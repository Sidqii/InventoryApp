import 'package:flutter/material.dart';

class CustomPanel extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const CustomPanel({
    required this.child,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding ??
          const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: 20,
          ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1
        )
      ),
      child: child,
    );
  }
}
