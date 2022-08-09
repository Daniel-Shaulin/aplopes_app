import 'package:aplopes_app/src/models/exception/object_exception.dart';

import 'package:json_annotation/json_annotation.dart';
part 'exception_model.g.dart';

@JsonSerializable()
class ExceptionModel{
  int status;
  DateTime timestamp;
  String? type;
  String title;
  String detail;
  String userMessage;
  List<ObjectException>? objectList;

  ExceptionModel({
    required this.status,
    required this.timestamp,
    this.type,
    required this.title,
    required this.detail,
    required this.userMessage,
    this.objectList
  });

  factory ExceptionModel.fromJson(Map<String, dynamic> json) => _$ExceptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExceptionModelToJson(this);
}

