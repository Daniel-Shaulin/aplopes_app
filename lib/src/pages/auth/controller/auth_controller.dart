import 'package:aplopes_app/src/pages/auth/repository/auth_repository.dart';
import 'package:aplopes_app/src/pages/auth/result/auth_result.dart';
import 'package:aplopes_app/src/pages_routes/app_pages.dart';
import 'package:aplopes_app/src/services/utils_services.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{

  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();
  String ?token = '';


  final utilsService = UtilsServices();

  Future<void> signIn({required String email,required String password,}) async{
    isLoading.value = true;

    AuthResult result =  await authRepository.signIn(email: email, password: password);

    isLoading.value = false;
    
    result.when(sucess: (token){
      this.token = token.token;
      //Get.offAllNamed(PagesRoutes.baseRout);
    }, error: (exception){
      utilsService.showToast(message: exception, isError: true);
    });
    
  }
}