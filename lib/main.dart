import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/config/FontTheme.dart';
import 'package:pusdatin_end/config/InitBinding.dart';
import 'package:pusdatin_end/config/AppTheme.dart';
import 'package:pusdatin_end/config/ScrollBar.dart';
import 'package:pusdatin_end/interface/common/HomeSignIn.dart';

void main() {
  runApp(MyApp());
}

final scaffoldMessangerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: NoScrollbarBehavior(),
      scaffoldMessengerKey: scaffoldMessangerKey,
      initialBinding: InitBinding(),
      theme: ThemeData.from(
        colorScheme: AppTheme.softFrostWhite.colorScheme,
        textTheme: FontTheme.lightTextTheme,
      ),
      home: HomeSignin(),
    );
  }
}
