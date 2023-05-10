import 'package:json_annotation/json_annotation.dart';

part 'add_user_data_to_user_info_table_tasks.g.dart';

@JsonSerializable()
class AddUserDataToUserInfoTableTask {
  // {
  // "username": "rounakraj@infostellar.com",
  // "company": "r3dInternationals",
  // "description": "hahahaha",
  // "email": "rounakraj@infostellar.com",
  // "name":"Raj",
  // "phone": "9871666482",
  // "profileUrl": "https://cdn.pixabay.com/photo/2021/03/09/20/52/elon-musk-6082845__340.png",
  // "type": "Designer"
  // }

  String username;
  String? company;
  String? description;
  String email;
  String name;
  String phone;
  String? profileUrl;
  String type;

  AddUserDataToUserInfoTableTask({required this.username, required this.company, required this.description, required this.email, required this.name, required this.phone, required this.profileUrl, required this.type});

  factory AddUserDataToUserInfoTableTask.fromJson(Map<String, dynamic> json) =>
      _$AddUserDataToUserInfoTableTaskFromJson(json);

  Map<String, dynamic> toJson() => _$AddUserDataToUserInfoTableTaskToJson(this);
}