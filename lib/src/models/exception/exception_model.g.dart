// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exception_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExceptionModel _$ExceptionModelFromJson(Map<String, dynamic> json) =>
    ExceptionModel(
      status: json['status'] as int,
      timestamp: DateTime.parse(json['timestamp'] as String),
      type: json['type'] as String?,
      title: json['title'] as String,
      detail: json['detail'] as String,
      userMessage: json['userMessage'] as String,
      error: json['error'] as String?,
      objectList: (json['objectList'] as List<dynamic>?)
          ?.map((e) => ObjectException.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExceptionModelToJson(ExceptionModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'timestamp': instance.timestamp.toIso8601String(),
      'type': instance.type,
      'title': instance.title,
      'detail': instance.detail,
      'userMessage': instance.userMessage,
      'error': instance.error,
      'objectList': instance.objectList,
    };
