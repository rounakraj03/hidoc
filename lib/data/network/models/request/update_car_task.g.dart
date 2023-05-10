// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_car_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCarTask _$UpdateCarTaskFromJson(Map<String, dynamic> json) =>
    UpdateCarTask(
      id: json['id'] as int,
      name: json['name'] as String,
      brand: json['brand'] as String,
      type: json['type'] as String,
      currentPrice: json['currentPrice'] as String,
      oldPrice: json['oldPrice'] as String,
      km: json['km'] as int,
      year: json['year'] as int,
      cost: json['cost'] as int,
      sold: json['sold'] as bool,
      imagePaths: json['imagePaths'] as List<dynamic>,
      reelPaths: json['reelPaths'] as List<dynamic>,
    );

Map<String, dynamic> _$UpdateCarTaskToJson(UpdateCarTask instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brand': instance.brand,
      'type': instance.type,
      'currentPrice': instance.currentPrice,
      'oldPrice': instance.oldPrice,
      'km': instance.km,
      'year': instance.year,
      'cost': instance.cost,
      'sold': instance.sold,
      'imagePaths': instance.imagePaths,
      'reelPaths': instance.reelPaths,
    };
