import 'package:flutter/material.dart';

class CustomTxtField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final TextInputType keyboardtype;
  final bool obscuretxt;
  final FocusNode focusnode;
  final void Function(String)? onfieldsubmitted;
  final Color? txtcolor;
  final Color? bgcolor;
  final Color? focuscolor;
  final double? fontsize;

  const CustomTxtField({
    required this.controller,
    required this.label,
    required this.validator,
    required this.keyboardtype,
    required this.obscuretxt,
    required this.focusnode,
    required this.onfieldsubmitted,
    this.txtcolor,
    this.bgcolor,
    this.focuscolor,
    this.fontsize,
    super.key,
  });

  @override
  State<CustomTxtField> createState() => _CustomTxtFieldState();
}

class _CustomTxtFieldState extends State<CustomTxtField> {
  late bool _isObscure = false;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscuretxt;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.keyboardtype,
      obscureText: _isObscure,
      focusNode: widget.focusnode,
      onFieldSubmitted: widget.onfieldsubmitted,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(
          color: widget.txtcolor ?? Colors.grey,
          fontSize: widget.fontsize ?? 14,
        ),
        filled: true,
        fillColor: widget.bgcolor ?? Colors.transparent,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: widget.focuscolor ?? Colors.black,
          ),
        ),
        suffixIcon: widget.obscuretxt
            ? IconButton(
                icon: Image.asset(
                  _isObscure
                      ? 'assets/icon/eyesoff.png'
                      : 'assets/icon/eyeson.png',
                  color: widget.focuscolor ?? Colors.black,
                  width: 24,
                  height: 24,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              )
            : null,
      ),
    );
  }
}
