import 'package:flutter/material.dart';

class EmptyPageOperator extends StatelessWidget {
  final String txt;

  const EmptyPageOperator({
    required this.txt,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.77,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xffF4F7F7),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(txt),
        ],
      ),
    );
  }
}
