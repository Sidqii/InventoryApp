import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const CustomBackground({required this.child, this.padding, super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 0,
        maxHeight: MediaQuery.of(context).size.height
      ),
      child: Container(
        width: double.infinity,
        padding: padding ?? const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300, width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: child,
      ),
    );
  }
}
