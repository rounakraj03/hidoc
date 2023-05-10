import 'package:hidoc/data/network/models/dashboard_data_result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dashboard_data.g.dart';

@JsonSerializable()
class DashboardData {
  // String message;
  Map data;
  // String timestamp;

  // DashboardData(this.data, this.timestamp, this.message);
  DashboardData(this.data);

  factory DashboardData.fromJson(Map<String, dynamic> json) =>
      _$DashboardDataFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardDataToJson(this);
}
