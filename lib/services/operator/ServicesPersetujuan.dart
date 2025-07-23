import 'dart:convert';
import 'package:http/http.dart' as http;

class ServicesPersetujuan {
  final String url = 'http://127.0.0.1:8000/api';

  Future<int> approve(
    int pengajuan,
    int sttsreqq,
    int sttsunit,
    int user,
    String? note,
  ) async {
    final response = await http.patch(
      Uri.parse('$url/persetujuan/$pengajuan'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        'id_status_pengajuan': sttsreqq,
        'id_status_unit': sttsunit,
        'id_user': user,
        'catatan': note ?? '',
      }),
    );
    return response.statusCode;
  }
}
