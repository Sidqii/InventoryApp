import 'dart:convert';
import 'package:http/http.dart' as http;

class ServicesUser {
  final String url = 'http://localhost/AssetsHub/users.php';

  Future<List<dynamic>> fetchUser() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Gagal memuat user');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
