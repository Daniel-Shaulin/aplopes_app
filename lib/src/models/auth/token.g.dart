// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      json['access_token'] as String?,
    )
      ..refreshToken = json['refresh_token'] as String?
      ..expirationToken = json['expires_in'] as int?
      ..userId = json['id'] as int?;

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'access_token': instance.token,
      'refresh_token': instance.refreshToken,
      'expires_in': instance.expirationToken,
      'id': instance.userId,
    };
