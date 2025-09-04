import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inven/app/data/models/AppBarang.dart';
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
}
