import 'package:json_annotation/json_annotation.dart';
part 'token.g.dart';

//flutter pub run build_runner build
@JsonSerializable()
class Token {
  @JsonKey(name: 'access_token')
  String? token;
  @JsonKey(name : "refresh_token")
  String? refreshToken;
  @JsonKey(name : "expires_in")
  int? expirationToken;
  @JsonKey(name: "id")
  int? userId;

  Token(this.token);

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);

}