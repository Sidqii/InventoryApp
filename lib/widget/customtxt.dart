import 'package:flutter/material.dart';

class Customtxt extends StatefulWidget {
  final TextEditingController controller;
  final String? label;
  final String? Function(String?)? validator;
  final TextInputType keyboardtype;
  final bool obscuretxt;
  final FocusNode focusnode;
  final void Function(String)? onfieldsubmitted;
  final void Function(String)? onChanged;
  final Color? txtcolor;
  final Color? bgcolor;
  final Color? focuscolor;
  final double? fontsize;

  const Customtxt({
    required this.controller,
    required this.label,
    required this.validator,
    required this.keyboardtype,
    required this.obscuretxt,
    required this.focusnode,
    required this.onfieldsubmitted,
    this.onChanged,
    this.txtcolor,
    this.bgcolor,
    this.focuscolor,
    this.fontsize,
    super.key,
  });

  @override
  State<Customtxt> createState() => _CustomtxtState();
}

class _CustomtxtState extends State<Customtxt> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscuretxt;
  }

  @override
  Widget build(BuildContext context) {
    final suffix = widget.obscuretxt
        ? IconButton(
            icon: Icon(
              _isObscure ? Icons.visibility_off : Icons.visibility,
              color: widget.focuscolor ?? Colors.black,
              size: 24,
            ),
            onPressed: () {
              if (mounted) {
                setState(() {
                  _isObscure = !_isObscure;
                });
              }
            },
          )
        : null;

    final lblStyle = TextStyle(
      color: widget.txtcolor ?? Colors.grey,
      fontSize: widget.fontsize ?? 14,
    );

    final bdrSide = BorderSide(
      color: widget.focuscolor ?? Colors.black,
    );

    return TextFormField(
      cursorColor: Colors.black,
      validator: widget.validator,
      keyboardType: widget.keyboardtype,
      obscureText: widget.obscuretxt ? _isObscure : false,
      focusNode: widget.focusnode,
      onFieldSubmitted: widget.onfieldsubmitted,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: lblStyle,
        filled: true,
        fillColor: widget.bgcolor ?? Colors.transparent,
        focusedBorder: UnderlineInputBorder(
          borderSide: bdrSide,
        ),
        suffixIcon: suffix,
      ),
    );
  }
}
