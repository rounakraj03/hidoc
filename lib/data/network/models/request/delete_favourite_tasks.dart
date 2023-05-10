import 'package:json_annotation/json_annotation.dart';

part 'delete_favourite_tasks.g.dart';

@JsonSerializable()
class DeleteFavouriteTask {
  String username;
  String favouriteEmail;

  DeleteFavouriteTask({required this.username, required this.favouriteEmail});

  factory DeleteFavouriteTask.fromJson(Map<String, dynamic> json) =>
      _$DeleteFavouriteTaskFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteFavouriteTaskToJson(this);
}
