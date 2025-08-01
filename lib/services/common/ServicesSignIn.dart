import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pusdatin_end/model/app_user.dart';
import 'package:pusdatin_end/services/AppConfig.dart';

class ServicesSignin {
  final String url = AppConfig.url;

  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$url/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );
      final result = jsonDecode(response.body);
      return {
        'status': response.statusCode,
        'user_id': result['user_id'],
      };
    } catch (e) {
      return {
        'status': 'Error',
        'message': 'Gagal melakukan login',
      };
    }
  }

  Future<AppUserModel?> getUser(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$url/login/$id'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return AppUserModel.fromJson(data['data']);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
