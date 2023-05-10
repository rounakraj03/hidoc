// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_data_tasks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardDataTask _$DashboardDataTaskFromJson(Map<String, dynamic> json) =>
    DashboardDataTask(
      username: json['username'] as String,
      page: json['page'] as int,
      lastEvaluatedKey: json['lastEvaluatedKey'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$DashboardDataTaskToJson(DashboardDataTask instance) =>
    <String, dynamic>{
      'username': instance.username,
      'page': instance.page,
      'lastEvaluatedKey': instance.lastEvaluatedKey,
    };
