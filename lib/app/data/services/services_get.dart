import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inven/app/data/models/AppBarang.dart';
import 'package:inven/app/data/models/AppJenis.dart';
import 'package:inven/app/data/models/AppKategori.dart';
import 'package:inven/app/data/models/AppPengembalian.dart';
import 'package:inven/app/data/models/AppUnitBarang.dart';
import 'package:inven/app/data/services/base_url.dart';

class ServicesGet {
  final String url = BaseUrl.url;

  //data barang
  Future<List<AppBarang>> getBarang() async {
    try {
      final response = await http.get(
        Uri.parse('$url/barang'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final decode = jsonDecode(response.body);

        final List<dynamic> data = decode[0];

        return data.map((e) {
          return AppBarang.fromJson(e);
        }).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Barang error $e');
    }
  }

  //data jenis barang
  Future<List<AppJenis>> getjenis() async {
    try {
      final response = await http.get(
        Uri.parse('$url/jenis'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        return data.map((e) {
          return AppJenis.fromJson(e);
        }).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Kategori error $e');
    }
  }

  //data kategori barang
  Future<List<AppKategori>> getKategori() async {
    try {
      final response = await http.get(
        Uri.parse('$url/kategori'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        return data.map((e) {
          return AppKategori.fromJson(e);
        }).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Kategori error $e');
    }
  }

  //data unit barang
  Future<List<AppUnitBarang>> getUnit() async {
    try {
      final response = await http.get(
        Uri.parse('$url/unit'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        return data.map((e) {
          return AppUnitBarang.fromJson(e);
        }).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Unit error $e');
    }
  }

  //data pengembalian (data yang dipinjam)
  Future<List<AppPengembalian>> getPengembalian() async {
    try {
      final response = await http.get(
        Uri.parse('$url/pengembalian'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        return data.map((e) {
          return AppPengembalian.fromJson(e);
        }).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Pengembalian error $e');
    }
  }
}
