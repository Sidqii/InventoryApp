import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onpress;
  final String txt;
  final Color? btncolor;
  final Color? txtcolor;
  final EdgeInsets? padding;
  final bool isloading;

  const CustomButton({
    required this.onpress,
    required this.txt,
    this.btncolor,
    this.txtcolor,
    this.padding,
    this.isloading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: FilledButton(
        onPressed: isloading ? (){} : onpress,
        style: FilledButton.styleFrom(
          backgroundColor: btncolor ?? Colors.grey[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: padding ??
              EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
          maximumSize: const Size(double.infinity, 55),
          elevation: 4,
          shadowColor: Colors.black.withValues(alpha: 1),
        ),
        child: isloading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Text(
                txt,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
      ),
    );
  }
}
