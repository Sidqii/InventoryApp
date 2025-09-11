import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:inven/app/data/models/AppPengajuan.dart';

import 'package:inven/app/data/services/base_url.dart';

class ServRiwayat {
  final url = BaseUrl.url;

  Future<List<AppPengajuan>> peminjaman(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$url/pengajuan/$id'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        return data.map((e) => AppPengajuan.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('services peminjaman error: $e');
    }
  }

  Future<List<AppPengajuan>> riwayatAll(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$url/riwayat/$id'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        return data.map((e) => AppPengajuan.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('services riwayat error: $e');
    }
  }
}
