import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:inven/app/data/models/AppPengajuan.dart';

import 'package:inven/app/data/services/base_url.dart';

class ServPengajuan {
  final url = BaseUrl.url;

  Future<AppPengajuan?> pengajuan(
    int id,
    String inst,
    String ketr,
    String tglPinjam,
    String tglKembali,
    List<int> unit,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$url/pengajuan'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'id_pengguna': id,
          'instansi': inst,
          'hal': ketr,
          'tgl_pinjam': tglPinjam,
          'tgl_kembali': tglKembali,
          'unit_barang': unit,
        }),
      );

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        final data = result['data'];

        return AppPengajuan.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('pengajuan error $e');
    }
  }
}
