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
      height: MediaQuery.of(context).size.height *0.77,
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
            height: MediaQuery.of(context).size.height *0.74,
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
