import 'package:hidoc/data/network/models/dashboard_data_result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dashboard_data.g.dart';

@JsonSerializable()
class DashboardData {
  List news;
  List trandingBulletin;
  String specialityName;
  List latestArticle;
  List exploreArticle;
  List trandingArticle;
  Map article;
  List bulletin;
  int sId;

  DashboardData(this.news, this.trandingBulletin,this.specialityName,this.latestArticle,this.exploreArticle, this.trandingArticle, this.article, this.bulletin, this.sId);

  factory DashboardData.fromJson(Map<String, dynamic> json) =>
      _$DashboardDataFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardDataToJson(this);
}
