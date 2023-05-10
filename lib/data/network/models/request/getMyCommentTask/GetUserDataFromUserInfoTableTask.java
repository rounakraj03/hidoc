import 'package:json_annotation/json_annotation.dart';

part 'get_user_data_from_user_info_table_tasks.g.dart';

@JsonSerializable()
class GetUserDataFromUserInfoTableTask {
  String username;

  GetUserDataFromUserInfoTableTask(this.username);

  factory GetUserDataFromUserInfoTableTask.fromJson(Map<String, dynamic> json) =>
      _$GetUserDataFromUserInfoTableTaskFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserDataFromUserInfoTableTaskToJson(this);
}