import 'dart:developer';

import 'package:dio/dio.dart';

class LoggerInterceptor extends Interceptor {
  static const _logPrefix = 'Dio';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('Request: ${options.method} ${options.uri}', name: _logPrefix);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    String responseBody;
    if (response.data is Iterable) {
      final length = (response.data as Iterable).length;
      responseBody = 'Iterable with $length items';
    } else {
      responseBody = response.data.toString();
    }
    log(
      'Response: STATUS: ${response.statusCode}, $responseBody',
      name: _logPrefix,
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log(
      'Error: ${err.response?.statusCode} ${err.response?.data ?? err.message}',
      name: _logPrefix,
    );
    super.onError(err, handler);
  }
}
