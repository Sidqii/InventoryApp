import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pusdatin_end/module/controller/ctrl_items.dart';
import 'package:pusdatin_end/page/main/riwayat.dart';
import 'package:pusdatin_end/widget/customtheme.dart';

void initController() {
  Get.lazyPut(() => CtrlItems());
}

void main() {
  initController();
  runApp(MyApp());
}

final scaffoldMessangerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scaffoldMessengerKey: scaffoldMessangerKey,
      theme: ThemeData.from(
        colorScheme: AppThemes.softFrostWhite.colorScheme,
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
      ),
      home: RiwayatPage(),
    );
  }
}
