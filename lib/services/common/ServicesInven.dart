import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pusdatin_end/model/app_barang.dart';

class ServicesInven {
  final String url = 'http://127.0.0.1:8000/api';

  Future<List<AppBarangModel>> getItems() async {
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
}
