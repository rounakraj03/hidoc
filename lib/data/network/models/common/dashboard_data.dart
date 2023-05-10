import 'package:hidoc/data/network/models/dashboard_data_result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dashboard_data.g.dart';

@JsonSerializable()
class DashboardData {
  List<DashboardDataResult> data;
  Map lastEvaluatedKey;

  DashboardData(this.data, this.lastEvaluatedKey);

  factory DashboardData.fromJson(Map<String, dynamic> json) =>
      _$DashboardDataFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardDataToJson(this);
}
