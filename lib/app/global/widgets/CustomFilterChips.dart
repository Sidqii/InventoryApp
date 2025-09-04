import 'package:flutter/material.dart';

class CustomFilterChips extends StatelessWidget {
  final Map<int, String> opsi;
  final int select;
  final void Function(int) isSelect;

  CustomFilterChips({
    required this.opsi,
    required this.select,
    required this.isSelect,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: buildChips()),
    );
  }

  List<Widget> buildChips() {
    List<Widget> chips = [];

    opsi.forEach((key, label) {
      bool isActive = key == select;

      chips.add(
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: GestureDetector(
            onTap: () {
              isSelect(key);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isActive ? Colors.grey[900] : Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                label,
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.grey[900],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      );
    });
    return chips;
  }
}
