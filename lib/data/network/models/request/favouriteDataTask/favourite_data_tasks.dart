import 'package:json_annotation/json_annotation.dart';

part 'favourite_data_tasks.g.dart';

@JsonSerializable()
class FavouriteDataTask {
  String username;
  int page;
  String lastEvaluatedKey;


  FavouriteDataTask({required this.username, required this.page, required this.lastEvaluatedKey});

  factory FavouriteDataTask.fromJson(Map<String, dynamic> json) =>
      _$FavouriteDataTaskFromJson(json);

  Map<String, dynamic> toJson() => _$FavouriteDataTaskToJson(this);
}