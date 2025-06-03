import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontTheme {
  static TextTheme get lightTextTheme {
    return GoogleFonts.poppinsTextTheme()
        .apply(bodyColor: Colors.black, displayColor: Colors.black);
  }
}
