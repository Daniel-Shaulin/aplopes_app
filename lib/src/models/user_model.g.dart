// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      discordCode: json['discordCode'] as String?,
      password: json['password'] as String?,
      cpf: json['cpf'] as String?,
      userIcon: json['userIcon'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'discordCode': instance.discordCode,
      'password': instance.password,
      'cpf': instance.cpf,
      'status': instance.status,
      'userIcon': instance.userIcon,
    };
