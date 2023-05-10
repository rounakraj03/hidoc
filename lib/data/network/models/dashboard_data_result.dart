import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'dashboard_data_result.g.dart';

@JsonSerializable()
class DashboardDataResult {
  DashboardDataResult(
    this.backgroundImage,
    this.rating,
    this.bio,
    this.imageList,
    this.username,
    this.order,
    this.phone,
    this.name,
    this.profileImage,
    this.showLike);

  //    "backgroundImage": "https://hcinterior.in/wp-content/uploads/2021/10/hc-bg.jpg.webp",
      //                 "rating": 5,
      //                 "bio": "HC Interior is a leading Residential and Commercial interior design company in Delhi-NCR and has a corporate office in Noida. If you are looking out for a beautiful home that fits in your budget, yes ! you are at the right place, we will make your dream home come true !!",
      //                 "imageList": {"Restaurant": [],
      //                     "Hospital": [],
      //                     "Kitchen": [],
      //                     "Offices": [],
      //                     "Bedroom": [],
      //                     "Living Room": []
      //                 },
      //                 "username": "rounakraj@infostellar.com",
      //                 "order": [],
      //                 "phone": "+919315025029",
      //                 "name": "1 Interiors",
      //                 "profileImage": "https://hcinterior.in/wp-content/uploads/2021/10/cropped-hc-logo.png.webp",
      //                 "showLike": true

  @JsonKey(name: "backgroundImage")
  String backgroundImage;

  @JsonKey(name: "rating")
  double rating;

  @JsonKey(name: "bio")
  String bio;

  @JsonKey(name: "imageList")
  Map imageList;

  @JsonKey(name: "username")
  String username;

  @JsonKey(name: "order")
  List order;

  @JsonKey(name: "phone")
  String phone;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "profileImage")
  String profileImage;

  @JsonKey(name: "showLike")
  bool showLike;

  factory DashboardDataResult.fromJson(Map<String, dynamic> json) =>
      _$DashboardDataResultFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardDataResultToJson(this);
}
