import 'package:flutter/material.dart';

class EmptyPageStaff extends StatelessWidget {
  final String txt;

  const EmptyPageStaff({
    required this.txt,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 143,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 120,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xffF4F7F7),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(txt),
            ),
          ),
        ],
      ),
    );
  }
}
