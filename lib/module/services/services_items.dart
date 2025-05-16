import 'dart:convert';
import 'package:http/http.dart' as http;

class ServicesItems {
  final String url = 'http://localhost/AssetsHubBE/src/endpoint/item.php';

  Future<List<Map<String, dynamic>>> getItems() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.cast<Map<String, dynamic>>();
      } else {
        print('${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('${e}');
      return [];
    }
  }
}
