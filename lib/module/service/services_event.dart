import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ServicesEvent extends GetConnect {
  final String url = 'http://localhost/AssetsHub/event.php';

  Future<List<dynamic>> fetchEvent() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Gagal memuat event');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
