import 'dart:convert';
import 'package:http/http.dart' as http;

class ServicesRiwayat {
  final String url = 'http://localhost/AssetsHubBE/src/endpoint/riwayat.php';

  Future<List<Map<String, dynamic>>> getAllRiwayat() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.cast<Map<String, dynamic>>();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getIdRiwayat(int userId) async {
    try {
      final response = await http.get(Uri.parse('$url?id_pengguna=$userId'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.cast<Map<String, dynamic>>();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
