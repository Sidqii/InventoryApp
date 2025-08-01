import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pusdatin_end/model/app_unit.dart';
import 'package:pusdatin_end/services/AppConfig.dart';

class ServicesPengajuan {
  final String url = AppConfig.url;

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

  Future<List<AppUnitModel>> GetByID() async {
    try {
      final response = await http.get(
        Uri.parse('$url/pengajuan/barang-tersedia'),
      );
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        return data.map((e) {
          return AppUnitModel.fromJson(e);
        }).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
