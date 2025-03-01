import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final getIt = GetIt.instance;

enum ApiType { auth, crypto }

extension ApiTypeExtension on ApiType {
  String get baseUrl {
    switch (this) {
      case ApiType.auth:
        return dotenv.env['AUTH_BASE_URL'] ??"";
      case ApiType.crypto:
        return dotenv.env['CRYPTO_BASE_URL'] ?? "";
    }
  }

  Dio get dio => getIt<Dio>(instanceName: name);


  BaseOptions get baseOptions {
    return BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
    );
  }


}
