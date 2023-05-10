import 'package:json_annotation/json_annotation.dart';

part 'dashboard_data_tasks.g.dart';

@JsonSerializable()
class DashboardDataTask {
  int sid;
  int userId;


  // {"sid":500,"userId":423914}


  DashboardDataTask({required this.sid, required this.userId});

  factory DashboardDataTask.fromJson(Map<String, dynamic> json) =>
      _$DashboardDataTaskFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardDataTaskToJson(this);
}