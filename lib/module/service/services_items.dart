import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ServicesItems extends GetConnect {
  final String baseUrl = 'http://localhost/AssetsHub/src/item.php';

  Future<List<Map<String, dynamic>>> getItems(int page, int limit) async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Gagal mengambil data');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
