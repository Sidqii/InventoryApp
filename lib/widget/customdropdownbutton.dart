import 'package:flutter/material.dart';

class CustomDropDownBtn<T> extends StatelessWidget {
  final T? value;
  final String label;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;

  const CustomDropDownBtn({
    this.value,
    required this.label,
    required this.items,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(bottom: 15, left: 15, right: 10, top: 15),
        hintText: label,
        hintStyle: TextStyle(
          color: Colors.grey.shade300,
          fontSize: 14,
        ),
        filled: true,
        fillColor: Colors.transparent,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
      items: items,
      onChanged: onChanged,
    );
  }
}
