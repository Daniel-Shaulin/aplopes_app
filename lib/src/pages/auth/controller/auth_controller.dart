import 'package:aplopes_app/src/constants/storage_keys.dart';
import 'package:aplopes_app/src/models/auth/token.dart';
import 'package:aplopes_app/src/models/user_model.dart';
import 'package:aplopes_app/src/pages/auth/repository/auth_repository.dart';
import 'package:aplopes_app/src/pages/auth/result/auth_result.dart';
import 'package:aplopes_app/src/pages_routes/app_pages.dart';
import 'package:aplopes_app/src/services/utils_services.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{

  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();
  Token token = Token('');

  final utilsService = UtilsServices();

  Future<void> validateToken() async{
    String? token = await utilsService.getLocalData(key: StorageKeys.token);

    if(token == null){
      Get.offAllNamed(PagesRoutes.signInRoute);
      return;
    }else{
      String? expirationToken = await utilsService.getLocalData(key: StorageKeys.expirationToken);
      String? refreshToken = await utilsService.getLocalData(key: StorageKeys.refreshToken);
      if(expirationToken != null && DateTime.parse(expirationToken).compareTo(DateTime.now()) > 0){
        Get.offAllNamed(PagesRoutes.baseRout);
      }else{
        AuthResult result =  await authRepository.refreshToken(refreshToken : refreshToken!);
        result.when(sucess: (token){
          this.token = token;
          saveTokenAndProssedToBase();
        }, error: (exception){
          utilsService.showToast(message: exception, isError: true);
        });
        saveTokenAndProssedToBase();
      }
    }
  }


  void saveTokenAndProssedToBase(){
    //Salvar token
    DateTime date = DateTime.now();
    date = date.add(Duration(seconds: token.expirationToken!));

    utilsService.saveLocalData(key: StorageKeys.token, data: token.token!);
    utilsService.saveLocalData(key: StorageKeys.expirationToken, data: date.toString());
    utilsService.saveLocalData(key: StorageKeys.refreshToken, data: token.refreshToken!);
    utilsService.saveLocalData(key: StorageKeys.userId, data: token.userId!.toString());
    Get.offAllNamed(PagesRoutes.baseRout);
  }

  Future<void> signIn({required String email,required String password,}) async{
    isLoading.value = false;

    AuthResult result =  await authRepository.signIn(email: email, password: password);
    isLoading.value = false;
    
    result.when(sucess: (token){
      this.token = token;
      saveTokenAndProssedToBase();
    }, error: (exception){
      utilsService.showToast(message: exception, isError: true);
    });
    
  }
}