import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class NetworkResponse<T> {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "result")
  T? result;

  NetworkResponse(this.status, this.message, this.result);

  factory NetworkResponse.fromJson(
      Map<String, dynamic> json,
      T Function(dynamic json) fromJsonT,
      ) => _$NetworkResponseFromJson(json, fromJsonT);

  NetworkEntity toEntity() {
    return NetworkEntity(status!, message!, result!);
  }
}


class NetworkEntity<T> {
  String status;
  String message;
  T result;

  NetworkEntity(this.status, this.message, this.result);
}


@JsonSerializable()
class EmptyNetworkResponse<T> {
  @JsonKey(name: "status")
  String? status;
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
  String status;
  String message;

  EmptyEntity(this.status, this.message);
}
