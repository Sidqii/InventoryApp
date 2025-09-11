import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/AppBarang.dart';
import '../models/AppJenis.dart';
import '../models/AppKategori.dart';
import '../models/AppPengajuan.dart';
import '../models/AppUnitBarang.dart';
import '../services/base_url.dart';

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

  //data unit barang => operator
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

  //data unit barang => staff only
  Future<List<AppUnitBarang>> getUnitStaff() async {
    try {
      final response = await http.get(
        Uri.parse('$url/staff/unit'),
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
  Future<List<AppPengajuan>> getPinjam(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$url/pengajuan/$id'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        return data.map((e) {
          return AppPengajuan.fromJson(e);
        }).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Pengembalian All error $e');
    }
  }

  Future<List<AppPengajuan>> getRiwayat(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$url/riwayat/$id'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        return data.map((e) {
          return AppPengajuan.fromJson(e);
        }).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Pengembalian Id error $e');
    }
  }

  Future<List<AppPengajuan>> indexApp() async {
    try {
      final response = await http.get(
        Uri.parse('$url/app/riwayat/'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        return data.map((e) {
          return AppPengajuan.fromJson(e);
        }).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('services peminjaman error $e');
    }
  }
}
