import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class NetworkResponse<T> {
  @JsonKey(name: "success")
  int? success;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "timestamp")
  String? timestamp;
  @JsonKey(name: "data")
  T? data;

  NetworkResponse(this.success, this.message, this.data, this.timestamp);

  factory NetworkResponse.fromJson(
      Map<String, dynamic> json,
      T Function(dynamic json) fromJsonT,
      ) => _$NetworkResponseFromJson(json, fromJsonT);

  NetworkEntity toEntity() {
    return NetworkEntity(success!, message!, data!, timestamp!);
  }
}


class NetworkEntity<T> {
  int success;
  String message;
  String timestamp;
  T data;

  NetworkEntity(this.success, this.message, this.data, this.timestamp);
}


@JsonSerializable()
class EmptyNetworkResponse<T> {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

  EmptyNetworkResponse(
      this.status,
      this.message
      );

  factory EmptyNetworkResponse.fromJson(
      Map<String, dynamic> json,
      ) => _$EmptyNetworkResponseFromJson(json);

  EmptyEntity toEntity() {
    return EmptyEntity(status!, message!);
  }
}

class EmptyEntity {
  int status;
  String message;

  EmptyEntity(this.status, this.message);
}
