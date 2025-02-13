import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pusdatin_end/page/main/screen.dart';
import 'package:pusdatin_end/widget/customtheme.dart';

void main() {
  runApp(MyApp());
}

final scaffoldMessangerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldMessangerKey,
      theme: ThemeData.from(
        colorScheme: AppThemes.softFrostWhite.colorScheme,
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
      ),
      home: ScreenPage(),
    );
  }
}
