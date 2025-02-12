import 'package:flutter/material.dart';

class CustomSnackbar {
  static void show({
    required BuildContext context,
    required String message,
    Color bgcolor = Colors.black,
    Color txtcolor = Colors.white,
    Color iconcolor = Colors.white,
    IconData? icon,
    Duration duration = const Duration(seconds: 3),
  }) {
    final snackbar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              color: iconcolor,
              weight: 3,
            ),
            const SizedBox(width: 10),
          ],
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: txtcolor,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: bgcolor,
      behavior: SnackBarBehavior.floating,
      duration: duration,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
