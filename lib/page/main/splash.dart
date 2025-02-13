import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pusdatin_end/page/auth/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(2.seconds, () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 800),
          pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Assets',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: theme.colorScheme.onSurface,
                      ))
                  .animate()
                  .fadeIn(duration: 800.ms)
                  .moveY(begin: 20, end: 0, duration: 600.ms)
                  .blurXY(begin: 10, end: 0, duration: 500.ms),
              SizedBox(width: 5),
              Text('Hub.',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onPrimary,
                        shadows: [
                          Shadow(
                              color: theme.colorScheme.secondary,
                              blurRadius: 10),
                        ],
                      ))
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
