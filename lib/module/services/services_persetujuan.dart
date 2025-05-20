import 'dart:convert';
import 'package:http/http.dart' as http;

class ServicesPersetujuan {
  final String url = 'http://localhost/AssetsHubBE/src/endpoint/persetujuan.php';

  Future<int> patchPersetujuan(
    int idPengajuan,
    int idStatus,
  ) async {
    final response = await http.patch(Uri.parse(url),
        body: jsonEncode({
          'id_pengajuan': idPengajuan,
          'patch':[
            {
              'op':'replace',
              'path':'/id_status',
              'value': idStatus,
            }
          ]
        }),
        headers: {'Content-type': 'application/json'});
    return response.statusCode;
  }

  Future<List<Map<String, dynamic>>> getPersetujuan() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.cast<Map<String,dynamic>>();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
