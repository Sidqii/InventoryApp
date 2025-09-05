import 'package:flutter/material.dart';

class CustomBtnForm extends StatelessWidget {
  final VoidCallback OnPress;
  final String? label;
  final bool isLoading;
  final double? width;
  final Icon? icon;

  const CustomBtnForm({
    this.label,
    required this.isLoading,
    required this.OnPress,
    this.width,
    this.icon,
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
            : _buildChild(),
      ),
    );
  }

  Widget _buildChild() {
    if (icon != null && label != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          icon!,
          Text(
            label!,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      );
    } else if (icon != null) {
      return icon!;
    } else {
      return Text(
        label!,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
      );
    }
  }
}
