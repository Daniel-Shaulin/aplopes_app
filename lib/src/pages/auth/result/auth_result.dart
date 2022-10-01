

import 'package:aplopes_app/src/models/auth/token.dart';
import 'package:aplopes_app/src/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_result.freezed.dart';

//flutter pub run build_runner build
@freezed
class AuthResult with _$AuthResult{

  factory AuthResult.sucess(Token token) = Success;

  factory AuthResult.error(String message) = Error;
}