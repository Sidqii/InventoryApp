import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pusdatin_end/model/app_pengajuan.dart';

class ServicesPengajuan {
  final String url = 'http://127.0.0.1:8000/api';

  Future<int> postPengajuan(
    int unit,
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
        'id_unit_barang': unit,
        'id_pengguna': pengguna,
        'instansi': instansi,
        'hal': hal,
        'jumlah': jumlah,
        'tanggal_kembali': kembali,
      }),
    );

    print(
      'BODY YANG DIKIRIM: ' +
          jsonEncode(
            {
              'id_unit_barang': unit,
              'id_pengguna': pengguna,
              'instansi': instansi,
              'hal': hal,
              'jumlah': jumlah,
              'tanggal_kembali': kembali,
            },
          ),
    );

    print('Status kode: ${response.statusCode}');

    return response.statusCode;
  }

  Future<List<AppPengajuanModel>> getAllPengajuan() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        return data.map((e) {
          return AppPengajuanModel.fromJson(e);
        }).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<AppPengajuanModel>> getIdPengajuan(int userId) async {
    try {
      final response = await http.get(Uri.parse('$url?id_pengguna=$userId'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        return data.map((e) {
          return AppPengajuanModel.fromJson(e);
        }).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
