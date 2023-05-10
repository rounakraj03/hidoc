// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_data_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardDataResult _$DashboardDataResultFromJson(Map<String, dynamic> json) =>
    DashboardDataResult(
      json['backgroundImage'] as String,
      (json['rating'] as num).toDouble(),
      json['bio'] as String,
      json['imageList'] as Map<String, dynamic>,
      json['username'] as String,
      json['order'] as List<dynamic>,
      json['phone'] as String,
      json['name'] as String,
      json['profileImage'] as String,
      json['showLike'] as bool,
    );

Map<String, dynamic> _$DashboardDataResultToJson(
        DashboardDataResult instance) =>
    <String, dynamic>{
      'backgroundImage': instance.backgroundImage,
      'rating': instance.rating,
      'bio': instance.bio,
      'imageList': instance.imageList,
      'username': instance.username,
      'order': instance.order,
      'phone': instance.phone,
      'name': instance.name,
      'profileImage': instance.profileImage,
      'showLike': instance.showLike,
    };
