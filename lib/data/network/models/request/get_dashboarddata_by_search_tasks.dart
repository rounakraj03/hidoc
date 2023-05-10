import 'package:json_annotation/json_annotation.dart';

part 'get_dashboarddata_by_search_tasks.g.dart';

@JsonSerializable()
class GetDashboardDataBySearchTask {
  String item;
  String username;
  Map lastEvaluatedKey;
  int page;


  GetDashboardDataBySearchTask({required this.item,required this.username, required this.page,required this.lastEvaluatedKey});

  factory GetDashboardDataBySearchTask.fromJson(Map<String, dynamic> json) =>
      _$GetDashboardDataBySearchTaskFromJson(json);

  Map<String, dynamic> toJson() => _$GetDashboardDataBySearchTaskToJson(this);
}