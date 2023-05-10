import 'package:json_annotation/json_annotation.dart';

part 'get_userdata_from_userinfo_table_data.g.dart';

@JsonSerializable()
class GetUserdataFromUserinfoTableData {
  List data;
  bool available;

  GetUserdataFromUserinfoTableData(this.data, this.available);

  factory GetUserdataFromUserinfoTableData.fromJson(Map<String, dynamic> json) => _$GetUserdataFromUserinfoTableDataFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserdataFromUserinfoTableDataToJson(this);
}