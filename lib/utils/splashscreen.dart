import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pusdatin_end/interface/common/HomeSignIn.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Get.offAll(
        HomeSignin(),
        transition: Transition.fadeIn,
        duration: Duration(milliseconds: 980),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textPrimary = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: theme.colorScheme.onSurface,
    );
    final textAccent = TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: theme.colorScheme.onPrimary,
        shadows: [
          Shadow(
            color: theme.colorScheme.secondary,
            blurRadius: 10,
          )
        ]);

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Assets',
                style: textPrimary,
              )
                  .animate()
                  .fadeIn(duration: 800.ms)
                  .moveY(begin: 20, end: 0, duration: 600.ms)
                  .blurXY(begin: 10, end: 0, duration: 500.ms),
              const SizedBox(width: 5),
              Text(
                'Hub.',
                style: textAccent,
              )
                  .animate()
                  .fadeIn(duration: 800.ms)
                  .moveY(begin: 20, end: 0, duration: 600.ms)
                  .shake(duration: 700.ms, hz: 2),
            ],
          ),
        ),
      ),
    );
  }
}
