import 'package:get/get.dart';

class RestClient extends GetConnect {
  final _backendBaseUrl = 'http://dartweek.academiadoflutter.com.br';

  RestClient() {
    httpClient.baseUrl = _backendBaseUrl;
  }
}

class RestClientException implements Exception {
  final String message;
  final int? code;

  RestClientException(
    this.message, {
    this.code,
  });

  @override
  String toString() => 'RestClientException(message: $message, code: $code)';
}
