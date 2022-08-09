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
          body: {
            'email': email,
            'password': password
          }
      );
     if(result['token'] != null){
       final token = Token.fromJson(Map.from(result));
       return AuthResult.sucess(token);
     }else{
       final exception = ExceptionModel.fromJson(Map.from(result));
        return AuthResult.error(exception.userMessage);
     }
  }
}