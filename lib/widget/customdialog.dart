import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog {
  static void show({
    bool isSuccess = true,
    String? title,
    String? message,
    Duration duration = const Duration(seconds: 1),
  }) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        child: TweenAnimationBuilder(
          tween: Tween(begin: 0.8, end: 1.0),
          duration: const Duration(milliseconds: 300),
          builder: (context, double scale, child) {
            return Transform.scale(
              scale: scale,
              child: child,
            );
          },
          child: _buildDialogContent(isSuccess, title, message),
        ),
      ),
      barrierDismissible: true,
    );
    Future.delayed(
      duration,
      () {
        if (Get.isDialogOpen ?? false) {
          Get.back();
        }
      },
    );
  }

  static Widget _buildDialogContent(
    bool isSuccess,
    String? title,
    String? message,
  
  ) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSuccess ? Icons.check : Icons.close,
              size: 30,
              color: isSuccess ? Colors.green : Colors.red,
            ),
            if (title != null) ...[
              const SizedBox(height: 5),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
            if (message != null) ...[
              const SizedBox(height: 5),
              Text(
                message,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
