import 'package:hidoc/core/app_logger/app_logger.dart';
import 'package:hidoc/data/network/custom_network_exception.dart';
import 'package:hidoc/data/network/error/network_error.dart';
import 'package:hidoc/data/network/error/network_error_handler.dart';
import 'package:hidoc/data/network/models/common/base_response.dart';
import 'package:dartz/dartz.dart';

NetworkError _getNetworkError(Object e){
  return NetworkErrorHandler.getAppNetworkError(e);
}

extension EmptyNetworkResultExtension on Future<EmptyNetworkResponse> {
  Future<Either<NetworkError, EmptyEntity>> getResult() async {
    try {
      final res = await this;
      await throwIfCustomException(res.status, res.message);
      return Right(EmptyEntity(res.status!, res.message!));
    } catch (e) {
      AppLogger.logError(e);
      try{
        final networkError = _getNetworkError(e);
        await throwIfCustomException(networkError.status, networkError.errorMessage);
        return Left(networkError);
      } catch (e) {
        final networkError = _getNetworkError(e);
        return Left(networkError);
      }
    }
  }
}

extension NetworkResultExtension<T> on Future<NetworkResponse<T>> {
  Future<Either<NetworkError, NetworkEntity<T>>> getResult() async {
    try {
      final res = await this;
      await throwIfCustomException(res.status, res.message);
      return Right(NetworkEntity<T>(res.status!, res.message!, res.result!));
    } catch(e) {
      AppLogger.logError(e);
      try {
        final networkError = _getNetworkError(e);
        await throwIfCustomException(networkError.status, networkError.errorMessage);
        return Left(networkError);
      } catch (e) {
        final networkError = _getNetworkError(e);
        return Left(networkError);
      }
    }
  }
}