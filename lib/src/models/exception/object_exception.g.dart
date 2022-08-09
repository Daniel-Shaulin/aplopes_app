// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object_exception.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ObjectException _$ObjectExceptionFromJson(Map<String, dynamic> json) =>
    ObjectException(
      name: json['name'] as String,
      userMessage: json['userMessage'] as String,
    );

Map<String, dynamic> _$ObjectExceptionToJson(ObjectException instance) =>
    <String, dynamic>{
      'name': instance.name,
      'userMessage': instance.userMessage,
    };
