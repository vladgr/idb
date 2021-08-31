import 'package:idb/app/services/storage_service.dart';
import 'package:get_it/get_it.dart';

class Token {
  static Future<String?> getToken() async {
    return await GetIt.I<StorageService>().getString('token');
  }

  static Future<void> removeToken() async {
    return await GetIt.I<StorageService>().remove('token');
  }

  static Future<void> setToken(String token) async {
    return await GetIt.I<StorageService>().save('token', token);
  }
}
