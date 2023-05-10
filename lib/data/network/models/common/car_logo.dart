import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';

part 'car_logo.g.dart';

@JsonSerializable()
class CarLogoResult {
  String status;
  String message;
  CarLogo carLogo;

  CarLogoResult(this.status, this.message, this.carLogo);

  factory CarLogoResult.fromJson(Map<String, dynamic> json) => _$CarLogoResultFromJson(json);

  Map<String, dynamic> toJson() => _$CarLogoResultToJson(this);
}



@JsonSerializable()
class CarLogo {
  String companyName;
  String logoName;
  String logoData;// todo but I want to show video and Images in future..can I do that with String?

  CarLogo(this.companyName, this.logoName, this.logoData);

  factory CarLogo.fromJson(Map<String, dynamic> json) => _$CarLogoFromJson(json);

  Map<String, dynamic> toJson() => _$CarLogoToJson(this);
}