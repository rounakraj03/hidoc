import 'package:json_annotation/json_annotation.dart';

part 'update_my_profile_tasks.g.dart';

@JsonSerializable()
class UpdateMyProfileTask {
  String username;
  double rating;
  String name;
  Map imageList;
  String backgroundImage;
  String bio;
  List order;
  String phone;
  String profileImage;

  UpdateMyProfileTask(
      { required this.username,
        required this.imageList,
        required this.rating,
        required this.name,
        required this.profileImage,
        required this.backgroundImage,
        required this.phone,
        required this.bio,
        required this.order});

  factory UpdateMyProfileTask.fromJson(Map<String, dynamic> json) =>
      _$UpdateMyProfileTaskFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateMyProfileTaskToJson(this);
}
