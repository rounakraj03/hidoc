import 'dart:io';

import 'package:hidoc/data/network/service/api_service.dart';
import 'package:hidoc/di/register_module.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class NetworkCall {
  Dio _dio;
  String baseUrl;
  // HttpClient _sslHttpClient;

  NetworkCall(
    this._dio,
    @Named(DIConstants.baseUrl) this.baseUrl,
    // this._sslHttpClient,
  );

  ApiService execute({String? token}) {
    _dio
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

    // (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (client) {
    //   return _sslHttpClient;
    // };
    return ApiService(_dio, baseUrl);
  }
}
