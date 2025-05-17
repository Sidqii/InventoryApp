import 'dart:convert';
import 'package:http/http.dart' as http;

class ServicesPengajuan {
  final String url = 'http://localhost/AssetsHubBE/src/endpoint/pengajuan.php';

  Future<int> pengajuan(
    int idPengguna,
    int idBarang,
    int jumlah,
    String tglKembali,
    String instansi,
    String hal,
  ) async {
    final response = await http.post(Uri.parse(url),
        body: jsonEncode({
          'id_pengguna': idPengguna,
          'id_barang': idBarang,
          'jumlah': jumlah,
          'tgl_kembali': tglKembali,
          'instansi': instansi,
          'hal': hal,
        }),
        headers: {'Content-Type': 'application/json'});
    return response.statusCode;
  }

  Future<List<Map<String, dynamic>>> getPengajuan() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.cast<Map<String, dynamic>>();
      } else {
        print('${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('${e}');
      return [];
    }
  }
}
