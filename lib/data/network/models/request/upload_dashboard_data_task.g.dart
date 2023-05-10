// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_dashboard_data_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadDashboardDataTask _$UploadDashboardDataTaskFromJson(
        Map<String, dynamic> json) =>
    UploadDashboardDataTask(
      name: json['name'] as String,
      rating: (json['rating'] as num).toDouble(),
      imageList: json['imageList'] as List<dynamic>,
    );

Map<String, dynamic> _$UploadDashboardDataTaskToJson(
        UploadDashboardDataTask instance) =>
    <String, dynamic>{
      'name': instance.name,
      'rating': instance.rating,
      'imageList': instance.imageList,
    };
