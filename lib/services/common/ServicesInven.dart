import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pusdatin_end/model/app_barang.dart';
import 'package:pusdatin_end/services/AppConfig.dart';

class ServicesInven {
  final String url = AppConfig.url;

  Future<List<AppBarangModel>> GetItems() async {
    try {
      final response = await http.get(
        Uri.parse('$url/barang'),
        headers: {'Accept': 'application/json'},
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        return data.map((e) {
          return AppBarangModel.fromJson(e);
        }).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<AppBarangModel>> GetUnit() async {
    try {
      final response = await http.get(
        Uri.parse('$url/unit/tersedia'),
        headers: {'Accept': 'application/json'},
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        return data.map((e) {
          return AppBarangModel.fromJson(e);
        }).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
