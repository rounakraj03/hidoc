import 'package:json_annotation/json_annotation.dart';

part 'get_my_comments_tasks.g.dart';

@JsonSerializable()
class GetMyCommentsTask {
  String designerUsername;
  String customerUsername;

  GetMyCommentsTask({required this.designerUsername, required this.customerUsername});

  factory GetMyCommentsTask.fromJson(Map<String, dynamic> json) =>
      _$GetMyCommentsTaskFromJson(json);

  Map<String, dynamic> toJson() => _$GetMyCommentsTaskToJson(this);
}