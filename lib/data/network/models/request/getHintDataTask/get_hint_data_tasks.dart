import 'package:json_annotation/json_annotation.dart';

part 'get_hint_data_tasks.g.dart';

@JsonSerializable()
class GetHintDataTask {
  String item;
  String username;


  GetHintDataTask({required this.item,required this.username});

  factory GetHintDataTask.fromJson(Map<String, dynamic> json) =>
      _$GetHintDataTaskFromJson(json);

  Map<String, dynamic> toJson() => _$GetHintDataTaskToJson(this);
}