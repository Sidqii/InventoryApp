import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/config/FontTheme.dart';
import 'package:pusdatin_end/config/InitBinding.dart';
import 'package:pusdatin_end/config/AppTheme.dart';
import 'package:pusdatin_end/interface/common/HomeSignIn.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
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
        colorScheme: AppTheme.softFrostWhite.colorScheme,
        textTheme: FontTheme.lightTextTheme,
      ),
      home: HomeSignin(),
    );
  }
}
