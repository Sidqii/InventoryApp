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
      padding: padding ??
          const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: 40,
          ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(4, 4),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }
}
