import 'package:flutter/material.dart';

class CustomTxtForm extends StatelessWidget {
  final TextEditingController Controller;
  final String Label;
  final String? Function(String?)? Validator;
  final TextInputType? KeyboardType;
  final FocusNode Focus;
  final void Function(String?)? OnSubmit;
  final void Function(String?)? OnChange;

  const CustomTxtForm({
    required this.Controller,
    required this.Label,
    this.Validator,
    this.KeyboardType,
    required this.Focus,
    this.OnSubmit,
    this.OnChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      controller: Controller,
      validator: Validator,
      keyboardType: KeyboardType,
      focusNode: Focus,
      onFieldSubmitted: OnSubmit,
      onChanged: OnChange,
      decoration: InputDecoration(
        labelText: Label,
        labelStyle: const TextStyle(fontSize: 14, color: Colors.grey),
        filled: true,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
