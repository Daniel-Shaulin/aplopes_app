import 'package:aplopes_app/src/constants/endpoints.dart';
import 'package:aplopes_app/src/services/http_manager.dart';

class AutoRepository{

  final HttpManager _httpManager = HttpManager();


  Future signIn({required String email, required String password}) async{
     final result = await _httpManager.restRequest(
          url: Endpoints.signin,
          method: HttpMethods.post,
          body: {
            'email': email,
            'password': password
          }
      );

     if(result['token'] != null){
       print('funcionou');
     }else{
       print('não funcionou');
     }
  }
}