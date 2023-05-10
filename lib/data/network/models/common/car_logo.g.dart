// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_logo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarLogoResult _$CarLogoResultFromJson(Map<String, dynamic> json) =>
    CarLogoResult(
      json['status'] as String,
      json['message'] as String,
      CarLogo.fromJson(json['carLogo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CarLogoResultToJson(CarLogoResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'carLogo': instance.carLogo,
    };

CarLogo _$CarLogoFromJson(Map<String, dynamic> json) => CarLogo(
      json['companyName'] as String,
      json['logoName'] as String,
      json['logoData'] as String,
    );

Map<String, dynamic> _$CarLogoToJson(CarLogo instance) => <String, dynamic>{
      'companyName': instance.companyName,
      'logoName': instance.logoName,
      'logoData': instance.logoData,
    };
