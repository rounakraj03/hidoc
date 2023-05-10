import 'package:hidoc/data/network/models/dashboard_data_result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hint_data.g.dart';

@JsonSerializable()
class HintData {
  List data;

  HintData(this.data);

  factory HintData.fromJson(Map<String, dynamic> json) =>
      _$HintDataFromJson(json);

  Map<String, dynamic> toJson() => _$HintDataToJson(this);
}
