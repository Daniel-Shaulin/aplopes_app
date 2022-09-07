import 'dart:convert';

import 'package:aplopes_app/src/constants/endpoints.dart';
import 'package:aplopes_app/src/models/auth/token.dart';
import 'package:aplopes_app/src/models/exception/exception_model.dart';
import 'package:aplopes_app/src/pages/auth/result/auth_result.dart';
import 'package:aplopes_app/src/services/http_manager.dart';

class AuthRepository{
  final HttpManager _httpManager = HttpManager();


  Future<AuthResult> signIn({required String email, required String password}) async{
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
     if(result['access_token'] != null){
       final token = Token.fromJson(Map.from(result));
       return AuthResult.sucess(token);
     }else{
       if(result.isEmpty){
         return AuthResult.error("Erro ao conectar-se no servidor");
       }
 //     final exception = ExceptionModel.fromJson(Map.from(result));
        return AuthResult.error(result['error_description']);
     }
  }

  Future<AuthResult> refreshToken({required String refreshToken}) async{
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
    if(result['access_token'] != null){
      final token = Token.fromJson(Map.from(result));
      return AuthResult.sucess(token);
    }else{
 //     final exception = ExceptionModel.fromJson(Map.from(result));
      return AuthResult.error(result['error_description']);
    }
  }

}