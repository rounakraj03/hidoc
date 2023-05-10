// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_my_profile_tasks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateMyProfileTask _$UpdateMyProfileTaskFromJson(Map<String, dynamic> json) =>
    UpdateMyProfileTask(
      username: json['username'] as String,
      imageList: json['imageList'] as Map<String, dynamic>,
      rating: (json['rating'] as num).toDouble(),
      name: json['name'] as String,
      profileImage: json['profileImage'] as String,
      backgroundImage: json['backgroundImage'] as String,
      phone: json['phone'] as String,
      bio: json['bio'] as String,
      order: json['order'] as List<dynamic>,
    );

Map<String, dynamic> _$UpdateMyProfileTaskToJson(
        UpdateMyProfileTask instance) =>
    <String, dynamic>{
      'username': instance.username,
      'rating': instance.rating,
      'name': instance.name,
      'imageList': instance.imageList,
      'backgroundImage': instance.backgroundImage,
      'bio': instance.bio,
      'order': instance.order,
      'phone': instance.phone,
      'profileImage': instance.profileImage,
    };
