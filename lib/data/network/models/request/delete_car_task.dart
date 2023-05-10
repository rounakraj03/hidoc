import 'package:json_annotation/json_annotation.dart';

part 'delete_car_task.g.dart';

@JsonSerializable()
class DeleteCarTask {
  int id;

  DeleteCarTask({
    required this.id});

  factory DeleteCarTask.fromJson(Map<String, dynamic> json) =>
      _$DeleteCarTaskFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteCarTaskToJson(this);
}