import 'package:json_annotation/json_annotation.dart';

part 'product_description_data.g.dart';

@JsonSerializable()
class ProductDescriptionData {
  List data;
  // List imageData;
  // List reelData;

  // ProductDescriptionData(this.infoData, this.imageData, this.reelData);
  ProductDescriptionData(this.data);

  factory ProductDescriptionData.fromJson(Map<String, dynamic> json) => _$ProductDescriptionDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDescriptionDataToJson(this);
}