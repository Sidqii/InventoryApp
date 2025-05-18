import 'dart:convert';
import 'package:http/http.dart' as http;

class ServicesLogin {
  final String urlLogin = 'http://localhost/AssetsHubBE/src/endpoint/login.php';
  final String urlUser = 'http://localhost/AssetsHubBE/src/endpoint/user.php';

  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(urlLogin),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );
      final result = jsonDecode(response.body);
      return {
        'status': response.statusCode,
        'user_id': result['user_id'],
      };
    } catch (e) {
      return {'status': 500};
    }
  }

  Future<Map<String, dynamic>> getUserId(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$urlUser?id=$id'),
        headers: {'Content-Type': 'application/json'},
      );
      final result = jsonDecode(response.body);
      return result;
    } catch (e) {
      return {
        'status': 'Error',
        'message': 'Gagal mengambil data',
      };
    }
  }
}
