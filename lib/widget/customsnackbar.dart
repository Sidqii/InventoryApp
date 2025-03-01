import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showIconDialog({
  required IconData icon,
  Color iconColor = Colors.blue,
  Duration duration = const Duration(seconds: 2),
}) {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Icon(icon, size: 30, color: iconColor),
      ),
    ),
    barrierDismissible: false,
  );

  Future.delayed(duration, () {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  });
}
