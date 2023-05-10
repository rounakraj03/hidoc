import 'package:json_annotation/json_annotation.dart';

part 'dashboard_data_tasks.g.dart';

@JsonSerializable()
class DashboardDataTask {
  String username;
  int page;
  Map lastEvaluatedKey;


  DashboardDataTask({required this.username, required this.page, required this.lastEvaluatedKey});

  factory DashboardDataTask.fromJson(Map<String, dynamic> json) =>
      _$DashboardDataTaskFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardDataTaskToJson(this);
}