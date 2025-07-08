import 'dart:convert';
import 'package:http/http.dart' as http;

class ServicesSignup {
  final String url = 'http://localhost/AssetsHubBE/src/endpoint/registrasi.php';

  Future<Map<String, dynamic>> register(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: {'Content-Type': 'application/json'},
      );
      final result = jsonDecode(response.body);
      return {
        'status': response.statusCode,
        'data': result,
      };
    } catch (e) {
      return {
        'status': 'Error',
        'message': 'Gagal register',
      };
    }
  }
}
