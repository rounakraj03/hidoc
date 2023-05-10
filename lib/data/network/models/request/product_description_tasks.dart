import 'package:json_annotation/json_annotation.dart';

part 'product_description_tasks.g.dart';

@JsonSerializable()
class ProductDescriptionTask {
  int id;

  ProductDescriptionTask(this.id);

  factory ProductDescriptionTask.fromJson(Map<String, dynamic> json) =>
      _$ProductDescriptionTaskFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDescriptionTaskToJson(this);
}