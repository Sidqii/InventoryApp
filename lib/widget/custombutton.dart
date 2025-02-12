import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onpress;
  final String txt;
  final Color? btncolor;
  final Color? txtcolor;
  final EdgeInsets? padding;

  const CustomButton({
    required this.onpress,
    required this.txt,
    this.btncolor,
    this.txtcolor,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: onpress,
        style: FilledButton.styleFrom(
          backgroundColor: btncolor ?? Colors.grey[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: padding ??
              EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
          maximumSize: const Size(double.infinity, 55),
          elevation: 10,
          shadowColor: Colors.black.withValues(alpha: 1),
        ),
        child: Text(
          txt,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
