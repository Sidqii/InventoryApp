import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ServicesRegister extends GetConnect {
  final String baseUrl = 'http://localhost/AssetsHub/src/register.php';

  Future<int> register(String email, String hashPassword) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      body: jsonEncode({
        'email': email,
        'password': hashPassword,
      }),
      headers: {'Content-Type': 'application/json'},
    );
    return response.statusCode;
  }
}
