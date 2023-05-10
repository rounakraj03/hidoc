import 'package:hidoc/core/app_logger/app_logger.dart';
import 'package:dio/dio.dart';

Future<void> throwIfCustomException(String? status, String? message) async {
  List<String> validStatus = List.generate(10, (index) => "20$index");

  if (!validStatus.contains(status?.toLowerCase().trim())) {
    AppLogger.log(
        "Checking for Custom Network Exception: {status : $status : message: $message}}");
    throw CustomNetworkException(status, message);
  }
}


class CustomNetworkException extends DioError {
  CustomNetworkException(String? status, String? message)
  : super(
    requestOptions: RequestOptions(path: '/resStatusCheck'),
    type: DioErrorType.response,
    response: Response(
      data: {"message": message ?? "", "status": status},
      statusCode: int.parse(status ?? "0"),
      requestOptions: RequestOptions(path: '/resStatusCheck'),
    ),
  );
}