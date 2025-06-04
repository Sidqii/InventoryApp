import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/config/fonttheme.dart';
import 'package:pusdatin_end/config/initbinding.dart';
import 'package:pusdatin_end/config/apptheme.dart';
import 'package:pusdatin_end/interface/auth/interface_login.dart';

void main() {
  runApp(MyApp());
}

final scaffoldMessangerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scaffoldMessengerKey: scaffoldMessangerKey,
      initialBinding: InitBinding(),
      theme: ThemeData.from(
        colorScheme: AppThemes.softFrostWhite.colorScheme,
        textTheme: FontTheme.lightTextTheme,
      ),
      home: InterfaceLogin(),
    );
  }
}
