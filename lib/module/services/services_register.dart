import 'dart:convert';
import 'package:http/http.dart' as http;

class ServicesRegister {
  final String baseUrl = 'http://localhost/AssetsHubBE/src/endpoint/registrasi.php';

  Future<int> register(String email, String hashPassword) async {
    final response = await http.post(
      Uri.parse('$baseUrl'),
      body: jsonEncode({
        'email': email,
        'password': hashPassword,
      }),
      headers: {'Content-Type': 'application/json'},
    );
    return response.statusCode;
  }
}
