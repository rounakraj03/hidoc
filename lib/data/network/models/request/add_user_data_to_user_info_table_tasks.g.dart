// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_user_data_to_user_info_table_tasks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddUserDataToUserInfoTableTask _$AddUserDataToUserInfoTableTaskFromJson(
        Map<String, dynamic> json) =>
    AddUserDataToUserInfoTableTask(
      username: json['username'] as String,
      company: json['company'] as String?,
      description: json['description'] as String?,
      email: json['email'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      profileUrl: json['profileUrl'] as String?,
      type: json['type'] as String,
    );

Map<String, dynamic> _$AddUserDataToUserInfoTableTaskToJson(
        AddUserDataToUserInfoTableTask instance) =>
    <String, dynamic>{
      'username': instance.username,
      'company': instance.company,
      'description': instance.description,
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'profileUrl': instance.profileUrl,
      'type': instance.type,
    };
