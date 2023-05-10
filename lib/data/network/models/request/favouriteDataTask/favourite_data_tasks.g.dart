// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_data_tasks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavouriteDataTask _$FavouriteDataTaskFromJson(Map<String, dynamic> json) =>
    FavouriteDataTask(
      username: json['username'] as String,
      page: json['page'] as int,
      lastEvaluatedKey: json['lastEvaluatedKey'] as String,
    );

Map<String, dynamic> _$FavouriteDataTaskToJson(FavouriteDataTask instance) =>
    <String, dynamic>{
      'username': instance.username,
      'page': instance.page,
      'lastEvaluatedKey': instance.lastEvaluatedKey,
    };
