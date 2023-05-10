import 'package:json_annotation/json_annotation.dart';

part 'write_my_comment_tasks.g.dart';

@JsonSerializable()
class WriteMyCommentTask {
  String designerUsername;
  String customerUsername;
  String customerReview;
  String customerDate;
  String customerName;
  int customerStar;

  WriteMyCommentTask({
    required this.designerUsername,
    required this.customerUsername,
    required this.customerReview,
    required this.customerDate,
    required this.customerName,
    required this.customerStar,
  });

  factory WriteMyCommentTask.fromJson(Map<String, dynamic> json) =>
      _$WriteMyCommentTaskFromJson(json);

  Map<String, dynamic> toJson() => _$WriteMyCommentTaskToJson(this);
}
