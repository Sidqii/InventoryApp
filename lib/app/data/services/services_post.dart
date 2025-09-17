import 'dart:convert';
import 'base_url.dart';
import 'package:http/http.dart' as http;

import 'package:inven/app/data/models/AppPengajuan.dart';
import 'package:inven/app/data/models/AppUser.dart';

class ServicesPost {
  final String url = BaseUrl.url;

  //post user login
  Future<AppUser?> postUser(String email, String pass) async {
    try {
      final response = await http.post(
        Uri.parse('$url/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': pass}),
      );

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        final data = result['data'];

        return AppUser.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Login error $e');
    }
  }

  Future<AppPengajuan?> proses(int id, int statusId, String note) async {
    try {
      final response = await http.post(
        Uri.parse('$url/persetujuan/$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'status_id': statusId, 'catatan': note}),
      );

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        final data = result['data'];

        return AppPengajuan.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Proses error $e');
    }
  }

  //post pengajuan peminjaman barang
  Future<AppPengajuan?> postPengajuan(
    int id,
    String instansi,
    String hal,
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
          'instansi': instansi,
          'hal': hal,
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
      throw Exception('Pengajuan error $e');
    }
  }
}
