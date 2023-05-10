import 'package:json_annotation/json_annotation.dart';

part 'upload_dashboard_data_task.g.dart';

@JsonSerializable()
class UploadDashboardDataTask {
  String name;
  double rating;
  List imageList;

  UploadDashboardDataTask({
    required this.name, required this.rating,
    required this.imageList});

  factory UploadDashboardDataTask.fromJson(Map<String, dynamic> json) =>
      _$UploadDashboardDataTaskFromJson(json);

  Map<String, dynamic> toJson() => _$UploadDashboardDataTaskToJson(this);
}