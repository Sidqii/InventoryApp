import 'package:flutter/material.dart';

class CustomBtnForm extends StatelessWidget {
  final VoidCallback OnPress;
  final String Label;
  final bool isLoading;
  final double? width;

  const CustomBtnForm({
    required this.Label,
    required this.isLoading,
    required this.OnPress,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: 45,
      child: FilledButton(
        onPressed: isLoading ? () {} : OnPress,
        style: FilledButton.styleFrom(
          backgroundColor: Colors.grey[900],
          padding: const EdgeInsets.symmetric(horizontal: 20),
          maximumSize: const Size(double.infinity, 55),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Text(
                Label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
