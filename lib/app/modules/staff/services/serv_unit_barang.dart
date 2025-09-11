import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:inven/app/data/models/AppBarang.dart';
import 'package:inven/app/data/models/AppUnitBarang.dart';

import 'package:inven/app/data/services/base_url.dart';

class ServUnitBarang {
  final url = BaseUrl.url;

  Future<List<AppBarang>> barang() async {
    try {
      final response = await http.get(
        Uri.parse('$url/barang'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final decode = jsonDecode(response.body);

        final List<dynamic> data = decode[0];

        return data.map((e) => AppBarang.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('services barang error: $e');
    }
  }

  Future<List<AppUnitBarang>> unitBarang() async {
    try {
      final response = await http.get(
        Uri.parse('$url/staff/unit'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        return data.map((e) => AppUnitBarang.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('services unit staff error: $e');
    }
  }
}
