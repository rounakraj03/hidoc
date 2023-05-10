// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardData _$DashboardDataFromJson(Map<String, dynamic> json) =>
    DashboardData(
      (json['data'] as List<dynamic>)
          .map((e) => DashboardDataResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['lastEvaluatedKey'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$DashboardDataToJson(DashboardData instance) =>
    <String, dynamic>{
      'data': instance.data,
      'lastEvaluatedKey': instance.lastEvaluatedKey,
    };
