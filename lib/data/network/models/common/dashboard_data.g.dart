// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardData _$DashboardDataFromJson(Map<String, dynamic> json) =>
    DashboardData(
      json['news'] as List<dynamic>,
      json['trandingBulletin'] as List<dynamic>,
      json['specialityName'] as String,
      json['latestArticle'] as List<dynamic>,
      json['exploreArticle'] as List<dynamic>,
      json['trandingArticle'] as List<dynamic>,
      json['article'] as Map<String, dynamic>,
      json['bulletin'] as List<dynamic>,
      json['sId'] as int,
    );

Map<String, dynamic> _$DashboardDataToJson(DashboardData instance) =>
    <String, dynamic>{
      'news': instance.news,
      'trandingBulletin': instance.trandingBulletin,
      'specialityName': instance.specialityName,
      'latestArticle': instance.latestArticle,
      'exploreArticle': instance.exploreArticle,
      'trandingArticle': instance.trandingArticle,
      'article': instance.article,
      'bulletin': instance.bulletin,
      'sId': instance.sId,
    };
