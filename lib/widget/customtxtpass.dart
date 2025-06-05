import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTxtPass extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? Function(String?)? validator;
  final FocusNode focusnode;
  final void Function(String)? onfieldsubmitted;
  final void Function(String)? onChanged;

  final RxBool rxObscure;
  final VoidCallback toggleObscure;

  const CustomTxtPass({
    required this.controller,
    required this.label,
    required this.validator,
    required this.rxObscure,
    required this.toggleObscure,
    required this.focusnode,
    required this.onfieldsubmitted,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        cursorColor: Colors.black,
        controller: controller,
        validator: validator,
        obscureText: rxObscure.value,
        focusNode: focusnode,
        onFieldSubmitted: onfieldsubmitted,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
          filled: true,
          fillColor: Colors.transparent,
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          suffixIcon: IconButton(
            onPressed: toggleObscure,
            icon: Icon(
              rxObscure.value ? Icons.visibility_off : Icons.visibility,
              color: Colors.black,
              size: 24,
            ),
          ),
        ),
      );
    });
  }
}
