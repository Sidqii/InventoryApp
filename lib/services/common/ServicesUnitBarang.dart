import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pusdatin_end/model/app_unit.dart';
import 'package:pusdatin_end/services/AppConfig.dart';

class ServicesUnitBarang {
  final String url = AppConfig.url;

  Future<List<AppUnitModel>> get() async {
    try {
      final response = await http.get(
        Uri.parse('$url/unitbarang'),
        headers: {'Accept': 'application/json'},
      );
      if (response.statusCode == 200) {
        final List<dynamic> body = jsonDecode(response.body);

        return body.map((e) {
          return AppUnitModel.fromJson(e);
        }).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
