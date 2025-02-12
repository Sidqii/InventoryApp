import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pusdatin_end/page/auth/login.dart';

void main() {
  runApp(MyApp());
}

final scaffoldMessangerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldMessangerKey,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.blueGrey,
          onPrimary: Colors.white,
          secondary: Colors.teal,
          onSecondary: Colors.white,
          error: Colors.redAccent,
          onError: Colors.grey,
          surface: Colors.grey[900]!,
          onSurface: Colors.white,
        ),
      ),
      home: LoginPage(),
    );
  }
}
