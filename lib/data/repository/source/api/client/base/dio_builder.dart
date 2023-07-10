import 'package:dio/dio.dart';

import '../../../../../../shared/shared.dart';

class DioBuilder {
  const DioBuilder._();

  static Dio createDio({
    BaseOptions? options,
  }) {
    return Dio(
      BaseOptions(
        connectTimeout: options?.connectTimeout ?? ServerConstants.connectTimeout,
        receiveTimeout: options?.receiveTimeout ?? ServerConstants.receiveTimeout,
        sendTimeout: options?.sendTimeout ?? ServerConstants.sendTimeout,
        baseUrl: options?.baseUrl ?? UrlConstants.appApiBaseUrl,
      ),
    );
  }
}
