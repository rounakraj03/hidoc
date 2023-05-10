import 'package:hidoc/data/network/error/network_error.dart';

abstract class ErrorModel {
  NetworkError getNetworkError(Map<String, dynamic> json);
}