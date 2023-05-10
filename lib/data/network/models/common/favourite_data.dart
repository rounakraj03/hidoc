import 'package:hidoc/data/network/models/dashboard_data_result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favourite_data.g.dart';

@JsonSerializable()
class FavouriteData {
  List<DashboardDataResult> data;
  String lastEvaluatedKey;

  FavouriteData(this.data, this.lastEvaluatedKey);

  factory FavouriteData.fromJson(Map<String, dynamic> json) =>
      _$FavouriteDataFromJson(json);

  Map<String, dynamic> toJson() => _$FavouriteDataToJson(this);
}
