// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'write_my_comment_tasks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WriteMyCommentTask _$WriteMyCommentTaskFromJson(Map<String, dynamic> json) =>
    WriteMyCommentTask(
      designerUsername: json['designerUsername'] as String,
      customerUsername: json['customerUsername'] as String,
      customerReview: json['customerReview'] as String,
      customerDate: json['customerDate'] as String,
      customerName: json['customerName'] as String,
      customerStar: json['customerStar'] as int,
    );

Map<String, dynamic> _$WriteMyCommentTaskToJson(WriteMyCommentTask instance) =>
    <String, dynamic>{
      'designerUsername': instance.designerUsername,
      'customerUsername': instance.customerUsername,
      'customerReview': instance.customerReview,
      'customerDate': instance.customerDate,
      'customerName': instance.customerName,
      'customerStar': instance.customerStar,
    };
