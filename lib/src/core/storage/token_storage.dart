import 'package:aban_tether/src/core/storage/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  final FlutterSecureStorage _secureStorage;

  TokenStorage(this._secureStorage);

  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: authToken, value: token);
  }

  Future<String?> getToken() async {
    return await _secureStorage.read(key: authToken);
  }

  Future<void> deleteToken() async {
    await _secureStorage.delete(key: authToken);
  }
}
