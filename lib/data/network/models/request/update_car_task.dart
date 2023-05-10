import 'package:json_annotation/json_annotation.dart';

part 'update_car_task.g.dart';

@JsonSerializable()
class UpdateCarTask {
  int id;
  String name;
  String brand;
  String type;
  String currentPrice;
  String oldPrice;
  int km;
  int year;
  int cost;
  bool sold;
  List imagePaths;
  List reelPaths;

  UpdateCarTask({
    required this.id,required this.name, required this.brand,
    required this.type, required this.currentPrice, required this.oldPrice,
    required this.km, required this.year, required this.cost, required this.sold,
    required this.imagePaths, required this.reelPaths});

  factory UpdateCarTask.fromJson(Map<String, dynamic> json) =>
      _$UpdateCarTaskFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCarTaskToJson(this);
}