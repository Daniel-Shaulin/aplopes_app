import 'package:aplopes_app/src/pages/auth/components/custom_text_field.dart';
import 'package:aplopes_app/src/pages/auth/controller/auth_controller.dart';
import 'package:aplopes_app/src/pages/auth/services/validators.dart';
import 'package:aplopes_app/src/pages/auth/view/sign_up_screen.dart';
import 'package:aplopes_app/src/pages/base/base_screen.dart';
import 'package:aplopes_app/src/config/custom_colors.dart';
import 'package:aplopes_app/src/pages_routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignInScreen  extends StatelessWidget {
  SignInScreen ({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;


    return Scaffold(
      backgroundColor: CustomColors.aplopesBasicColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child :Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/app_images/logo.svg'),
                  ],
                )
              ),
              //Formulário
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 40
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50)
                  )
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children:[

                      //Email
                      CustomTextField(
                        icon: Icons.email,
                        label: 'Email',
                        controller: emailController,
                        validator: emailValidators,
                      ),

                      //Senha
                      CustomTextField(
                        icon: Icons.lock,
                        label: 'Senha',
                        controller: passwordController,
                        isSecret: true,
                        validator: passwordValidators,
                      ),
                      //Botão entrar
                      SizedBox(
                        height: 50,
                          child: GetX<AuthController>(
                            builder: (authController){
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)
                                )
                              ),
                                onPressed: authController.isLoadingSignIn.value ? null : (){
                                FocusScope.of(context).unfocus();
                                  if(_formKey.currentState!.validate()){
                                    String password = passwordController.text;
                                    String email = emailController.text;
                                    authController.signIn(email: email, password: password);
                                  }
                                //
                                },
                                child: authController.isLoadingSignIn.value ?
                                const CircularProgressIndicator(
                                  color: CustomColors. aplopesBasicColor,
                                )
                                    : const Text('Entrar',
                                  style: TextStyle(fontSize: 18,
                                      color: Colors.white),)
                              );
                            }
                          )
                      ),

                      //Botão Esqueceu senha
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: (){},
                            child: const Text('Esqueceu a senha?',
                              style: TextStyle(
                                color: Colors.grey

                            ),)
                        ),
                      ),

                      //Divisor Ou
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: const[
                            Expanded(
                              child: Divider(
                                color: CustomColors.aplopesBasicColor,
                                thickness: 2,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15
                              ),
                              child: Text('ou', style: TextStyle(fontSize: 18)),
                            ),
                            Expanded(
                              child: Divider(
                                color: CustomColors.aplopesBasicColor,
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),
                      ),


                      //Botão criar conta
                      SizedBox(
                        height: 50,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)
                            ),
                            side: const BorderSide(
                              width: 2,
                              color: CustomColors.aplopesBasicColor
                            )
                          ),
                            onPressed: (){
                              Get.toNamed(PagesRoutes.signUpRoute);
                            },
                            child: const Text('Criar conta',
                            style: TextStyle(
                              fontSize: 18
                            ),)),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
