import 'package:flutter/material.dart';

class CustomFilterChips extends StatelessWidget {
  final Map<int, String> options;
  final int selected;
  final void Function(int) onSelected;

  const CustomFilterChips({
    required this.options,
    required this.selected,
    required this.onSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: buildChips(),
      ),
    );
  }

  List<Widget> buildChips() {
    List<Widget> chips = [];

    options.forEach((key, label) {
      bool isActive = key == selected;

      chips.add(Padding(
        padding: const EdgeInsets.only(right: 8),
        child: GestureDetector(
          onTap: () {
            onSelected(key);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isActive ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ));
    });
    return chips;
  }
}
