import 'dart:convert';
import 'package:http/http.dart' as http;

class ServicesPengajuan {
  final String url = 'http://localhost/AssetsHubBE/src/endpoint/pengajuan.php';

  Future<List<dynamic>> getPengajuan() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Gagal memuat data');
      }
    } catch (e) {
      return [];
    }
  }
}
