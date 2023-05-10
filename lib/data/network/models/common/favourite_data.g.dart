// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavouriteData _$FavouriteDataFromJson(Map<String, dynamic> json) =>
    FavouriteData(
      (json['data'] as List<dynamic>)
          .map((e) => DashboardDataResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['lastEvaluatedKey'] as String,
    );

Map<String, dynamic> _$FavouriteDataToJson(FavouriteData instance) =>
    <String, dynamic>{
      'data': instance.data,
      'lastEvaluatedKey': instance.lastEvaluatedKey,
    };
