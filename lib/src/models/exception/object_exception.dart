import 'package:json_annotation/json_annotation.dart';
part 'object_exception.g.dart';

@JsonSerializable()
class ObjectException {
  String name;
  String userMessage;

  ObjectException({
    required this.name,
    required this.userMessage
  });


  factory ObjectException.fromJson(Map<String, dynamic> json) => _$ObjectExceptionFromJson(json);

  Map<String, dynamic> toJson() => _$ObjectExceptionToJson(this);
}