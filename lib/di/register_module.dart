import 'package:hidoc/core/flavor_config.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

class DIConstants{
  static const String baseUrl = "baseUrl";
  static const String appError = "appError";
}

@module
abstract class RegisterModule {
  Dio get dio => Dio();

  @Named(DIConstants.baseUrl)
  String get baseUrl => FlavorConfig.instance.baseUrl;

}