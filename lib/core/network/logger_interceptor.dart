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
    log('Response: ${response.statusCode} ${response.data}', name: _logPrefix);
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
