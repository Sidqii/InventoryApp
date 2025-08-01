import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pusdatin_end/services/AppConfig.dart';

class ServicesSubmit {
  final String url = AppConfig.url;

  Future<int> revoke(
    int perubahan,
    int status,
    int user,
    int unit,
    String note,
  ) async {
    final response = await http.patch(
      Uri.parse('$url/unit/$unit/pengembalian'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        'id_jenis_perubahan': perubahan,
        'id_status_unit': status,
        'id_user': user,
        'catatan': note,
      }),
    );
    return response.statusCode;
  }
}
