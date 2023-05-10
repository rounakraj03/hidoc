// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_favourite_tasks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFavouriteTask _$AddFavouriteTaskFromJson(Map<String, dynamic> json) =>
    AddFavouriteTask(
      username: json['username'] as String,
      favouriteEmail: json['favouriteEmail'] as String,
      favouriteValue: json['favouriteValue'] as String,
    );

Map<String, dynamic> _$AddFavouriteTaskToJson(AddFavouriteTask instance) =>
    <String, dynamic>{
      'username': instance.username,
      'favouriteEmail': instance.favouriteEmail,
      'favouriteValue': instance.favouriteValue,
    };
