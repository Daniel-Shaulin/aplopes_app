import 'dart:convert';

import 'package:aplopes_app/src/config/generic/generic_result.dart';
import 'package:aplopes_app/src/constants/endpoints.dart';
import 'package:aplopes_app/src/models/auth/token.dart';
import 'package:aplopes_app/src/models/exception/exception_model.dart';
import 'package:aplopes_app/src/models/user_model.dart';
import 'package:aplopes_app/src/pages/auth/result/auth_result.dart';
import 'package:aplopes_app/src/services/http_manager.dart';

class AuthRepository{
  final HttpManager _httpManager = HttpManager();

  handleUserOrFail(Map<dynamic, dynamic> result){
    if(result['access_token'] != null){
      final token = Token.fromJson(Map.from(result));
      return GenericResult.sucess(token);
    }else{
      return GenericResult.error(result['error_description'] ?? 'Erro interno do servidor!');
    }
  }

  handleUseOrFail(Map<dynamic, dynamic> result){
    if(result[''] != null){
      final token = Token.fromJson(Map.from(result));
      return AuthResult.sucess(token);
    }else{
      return AuthResult.error(result['error_description'] ?? 'Erro interno do servidor!');
    }
  }

  Future<GenericResult> signIn({required String email, required String password}) async{
     final result = await _httpManager.restRequest(
         url: Endpoints.signin,
         method: HttpMethods.post,
         token: 'Basic YXBsb3Blcy1hcHA6MTIz',
         applicationType: 'application/x-www-form-urlencoded',
          body: {
            'username': email,
            'password': password,
            'grant_type': 'password'
          }
      );
     return handleUserOrFail(result);
  }

  Future<GenericResult> refreshToken({required String refreshToken}) async{
    final result = await _httpManager.restRequest(
        url: Endpoints.signin,
        method: HttpMethods.post,
        token: 'Basic YXBsb3Blcy1hcHA6MTIz',
        applicationType: 'application/x-www-form-urlencoded',
        body: {
          'refresh_token' : refreshToken,
          'grant_type': 'refresh_token'
        }
    );
   return handleUserOrFail(result);
  }

  Future<GenericResult> signUpUser(UserModel user) async{
    final result = await _httpManager.restRequest(
        url: Endpoints.signin,
        method: HttpMethods.post,
        body: user.toJson()
    );
    return handleUserOrFail(result);
  }


}