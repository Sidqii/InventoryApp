import 'package:flutter/material.dart';

class CustomTxtField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? Function(String?)? validator;
  final TextInputType keyboardtype;
  final FocusNode focusnode;
  final void Function(String)? onfieldsubmitted;
  final void Function(String)? onchanged;

  const CustomTxtField({
    required this.controller,
    required this.label,
    required this.validator,
    required this.keyboardtype,
    required this.focusnode,
    required this.onfieldsubmitted,
    this.onchanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      controller: controller,
      validator: validator,
      keyboardType: keyboardtype,
      focusNode: focusnode,
      onFieldSubmitted: onfieldsubmitted,
      onChanged: onchanged,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
        filled: true,
        fillColor: Colors.transparent,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
