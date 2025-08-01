import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pusdatin_end/services/AppConfig.dart';

class ServicesSignup {
  final String url = AppConfig.url;

  Future<Map<String, dynamic>> register(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$url/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
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
