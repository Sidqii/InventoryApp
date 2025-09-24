import 'package:get_storage/get_storage.dart';

class BaseUrl {
  static final box = GetStorage();

  static String get url {
    return box.read('base_url') ?? 'http://127.0.0.1:8000/api';
  }

  static void setUrl(String newUrl) {
    String domain = newUrl.trim();

    if (!domain.startsWith('http')) {
      domain = 'https://$domain';
    }

    if (!domain.endsWith('/api')) {
      domain = '$domain/api';
    }

    box.write('base_url', domain);
  }
}
