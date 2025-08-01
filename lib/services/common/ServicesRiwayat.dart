import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pusdatin_end/model/app_persetujuan.dart';
import 'package:pusdatin_end/model/app_riwayat.dart';
import 'package:pusdatin_end/services/AppConfig.dart';

class ServicesRiwayat {
  final String url = AppConfig.url;

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
