import 'dart:convert';
import 'package:http/http.dart' as http;

class ServicesItems {
  final String baseUrl = 'http://localhost/AssetsHubBE/src/endpoint/item.php';

  Future<List<dynamic>> getItems() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
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
