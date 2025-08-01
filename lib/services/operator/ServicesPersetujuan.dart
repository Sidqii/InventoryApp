import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pusdatin_end/services/AppConfig.dart';

class ServicesPersetujuan {
  final String url = AppConfig.url;

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
