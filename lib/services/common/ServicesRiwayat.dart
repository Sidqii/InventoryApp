import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pusdatin_end/model/app_persetujuan.dart';
import 'package:pusdatin_end/model/app_riwayat.dart';

class ServicesRiwayat {
  final String url = 'http://127.0.0.1:8000/api';

  Future<List<AppRiwayatModel>> GetAllRequest() async {
    try {
      final response = await http.get(Uri.parse('$url/pengajuan'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        return data.map((e) {
          return AppRiwayatModel.fromJson(e);
        }).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<AppPersetujuanModel>> GetAllApprove() async {
    try {
      final response = await http.get(Uri.parse('$url/persetujuan'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        print(const JsonEncoder.withIndent('  ').convert(data));

        return data.map((e) {
          return AppPersetujuanModel.fromJson(e);
        }).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
