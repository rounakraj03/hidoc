// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkResponse<T> _$NetworkResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    NetworkResponse<T>(
      json['success'] as int?,
      json['message'] as String?,
      _$nullableGenericFromJson(json['data'], fromJsonT),
      json['timestamp'] as String?,
    );

Map<String, dynamic> _$NetworkResponseToJson<T>(
  NetworkResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'timestamp': instance.timestamp,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

EmptyNetworkResponse<T> _$EmptyNetworkResponseFromJson<T>(
        Map<String, dynamic> json) =>
    EmptyNetworkResponse<T>(
      json['status'] as int?,
      json['message'] as String?,
    );

Map<String, dynamic> _$EmptyNetworkResponseToJson<T>(
        EmptyNetworkResponse<T> instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
