import 'package:hidoc/data/network/error/error_model.dart';
import 'package:hidoc/data/network/error/network_error.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppErrorModel extends ErrorModel{
  @override
  NetworkError getNetworkError(Map<String, dynamic> json) {
    return NetworkError((json['message'] ?? ''), json['status'] ?? '');
  }
}