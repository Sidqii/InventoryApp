import 'dart:convert';
import 'package:http/http.dart' as http;

class ServicesEvent {
  final String url = 'http://localhost/AssetsHubBE/event.php';

  Future<List<dynamic>> getEvent() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Gagal memuat data');
      }
    } catch (e) {
      return [];
    }
  }
}
