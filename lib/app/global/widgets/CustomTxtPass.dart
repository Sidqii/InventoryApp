import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTxtPass extends StatelessWidget {
  final TextEditingController Controller;
  final String? Label;
  final String? Function(String?)? Validator;
  final FocusNode? Focus;
  final void Function(String)? OnSubmit;
  final void Function(String)? OnChange;
  final RxBool isHidden;
  final VoidCallback ToggleHide;

  const CustomTxtPass({
    required this.Controller,
    this.Label,
    this.Validator,
    this.Focus,
    this.OnSubmit,
    this.OnChange,
    required this.isHidden,
    required this.ToggleHide,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        cursorColor: Colors.black,
        controller: Controller,
        validator: Validator,
        obscureText: isHidden.value,
        focusNode: Focus,
        onFieldSubmitted: OnSubmit,
        onChanged: OnChange,
        decoration: InputDecoration(
          labelText: Label,
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          filled: true,
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          suffixIcon: IconButton(
            onPressed: ToggleHide,
            icon: Icon(
              isHidden.value ? Icons.visibility_off : Icons.visibility,
              color: Colors.black,
              size: 24,
            ),
          ),
        ),
      );
    });
  }
}
