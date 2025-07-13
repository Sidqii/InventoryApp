import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onpress;
  final String txt;
  final bool isloading;

  const CustomButton({
    required this.onpress,
    required this.txt,
    this.isloading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: FilledButton(
        onPressed: isloading ? () {} : onpress,
        style: FilledButton.styleFrom(
          // elevation: 4,
          backgroundColor: Colors.grey[900],
          padding: const EdgeInsets.symmetric(horizontal: 20),
          maximumSize: const Size(double.infinity, 55),
          // shadowColor: Colors.black.withValues(alpha: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
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
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
      ),
    );
  }
}
