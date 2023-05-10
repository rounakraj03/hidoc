import 'dart:io';

import 'package:hidoc/core/app_logger/app_logger.dart';
import 'package:hidoc/data/network/error/app_error_model.dart';
import 'package:hidoc/data/network/error/error_model.dart';
import 'package:hidoc/data/network/error/network_error.dart';
import 'package:hidoc/di/di.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class NetworkErrorHandler {
  static NetworkError getAppNetworkError(dynamic error) {
    return _getNetworkError(error, inject<AppErrorModel>());
  }


  static NetworkError _getNetworkError(dynamic error, ErrorModel errorModel) {
    String networkExceptions;
    int statusCode = 0;
    if (error is Exception) {
      try {
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              networkExceptions = 'request_cancelled';
              break;
            case DioErrorType.connectTimeout:
              networkExceptions = 'connection_request_timeout';
              break;
            case DioErrorType.other:
              networkExceptions = "no_internet_connection";
              break;
            case DioErrorType.receiveTimeout:
              networkExceptions = 'receive_timeout';
              break;
            case DioErrorType.response:
              final response = error.response;
              statusCode = response?.statusCode ?? 0;
              try {
                networkExceptions = errorModel.getNetworkError(response!.data).error;
              } catch (e) {
                AppLogger.logError(e);
                networkExceptions = "invalid_status_code: $statusCode";
              }
              break;
            case DioErrorType.sendTimeout:
              networkExceptions = 'send_timeout';
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = 'no_internet_connection';
        } else {
          networkExceptions = 'unexpected_error_occured';
        }
      } on FormatException catch(e) {
        networkExceptions = 'unexpected_error_occured : ${e.message}';
      } catch (_) {
        networkExceptions = 'unexpected_error_occured';
      }
    } else {
      if(error.toString().contains("is not a subtype of")) {
        networkExceptions = 'unable_to_process';
      } else {
        networkExceptions = 'unexpected_error_occured';
      }
    }
    return NetworkError("", statusCode,networkExceptions, "");
  }
}