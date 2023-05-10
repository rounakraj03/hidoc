import 'package:json_annotation/json_annotation.dart';

part 'add_favourite_tasks.g.dart';

@JsonSerializable()
class AddFavouriteTask {
  String username;
  String favouriteEmail;
  String favouriteValue;

  AddFavouriteTask(
      {required this.username,
      required this.favouriteEmail,
      required this.favouriteValue});

  factory AddFavouriteTask.fromJson(Map<String, dynamic> json) =>
      _$AddFavouriteTaskFromJson(json);

  Map<String, dynamic> toJson() => _$AddFavouriteTaskToJson(this);
}
