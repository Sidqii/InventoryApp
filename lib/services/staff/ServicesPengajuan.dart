import 'dart:convert';
import 'package:http/http.dart' as http;

class ServicesPengajuan {
  final String url = 'http://127.0.0.1:8000/api';

  Future<int> postPengajuan(
    int barang,
    int pengguna,
    String instansi,
    String hal,
    int jumlah,
    String kembali,
  ) async {
    final response = await http.post(
      Uri.parse('$url/pengajuan'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'id_barang': barang,
        'id_pengguna': pengguna,
        'instansi': instansi,
        'hal': hal,
        'jumlah': jumlah,
        'tanggal_kembali': kembali,
      }),
    );
    return response.statusCode;
  }
}
