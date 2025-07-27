import 'dart:convert';
import 'package:http/http.dart' as http;

class ServicesSubmit {
  final String url = 'http://127.0.0.1:8000/api';

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
