import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inven/app/data/models/AppBarang.dart';
import 'package:inven/app/data/models/AppPengajuan.dart';
import 'package:inven/app/data/services/base_url.dart';

class ServicesUpdate {
  final String url = BaseUrl.url;

  Future<bool> updtItem(int id, AppBarang data) async {
    try {
      final response = await http.put(
        Uri.parse('$url/update/$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data.toJson()),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<AppPengajuan?> updtReturn(
    int id,
    List<int> uId,
    int statId,
  ) async {
    try {
      final response = await http.put(
        Uri.parse('$url/pengajuan/$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'unit': uId
              .map((uId) => {'id_unit': uId, 'status_baru': statId})
              .toList(),
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return AppPengajuan.fromJson(data['data']);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Pengembalian error $e');
    }
  }
}
