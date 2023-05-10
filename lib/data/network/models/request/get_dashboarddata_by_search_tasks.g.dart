// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_dashboarddata_by_search_tasks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDashboardDataBySearchTask _$GetDashboardDataBySearchTaskFromJson(
        Map<String, dynamic> json) =>
    GetDashboardDataBySearchTask(
      item: json['item'] as String,
      username: json['username'] as String,
      page: json['page'] as int,
      lastEvaluatedKey: json['lastEvaluatedKey'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$GetDashboardDataBySearchTaskToJson(
        GetDashboardDataBySearchTask instance) =>
    <String, dynamic>{
      'item': instance.item,
      'username': instance.username,
      'lastEvaluatedKey': instance.lastEvaluatedKey,
      'page': instance.page,
    };
