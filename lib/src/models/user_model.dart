import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

//flutter pub run build_runner build
@JsonSerializable()
class UserModel{
  String? id;
  String? name;
  String? email;
  String? phone;
  String? discordCode;
  String? password;
  String? cpf;
  String? status;
  String? userIcon;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.discordCode,
    this.password,
    this.cpf,
    this.userIcon,
    this.status,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  String toString(){
    return 'name: $name | cpf: $cpf';
  }
}