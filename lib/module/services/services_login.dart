import 'dart:convert';
import 'package:http/http.dart' as http;

class ServicesUser {
  final String url = 'http://localhost/AssetsHubBE/src/services/login.php';

  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );
      final result = jsonDecode(response.body);

      return {
        'status': response.statusCode,
        'user': result['user'],
      };
    } catch (e) {
      return {'status': 500};
    }
  }
}
