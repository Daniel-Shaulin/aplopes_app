import 'package:aplopes_app/src/pages/auth/components/custom_text_field.dart';
import 'package:aplopes_app/src/config/custom_colors.dart';
import 'package:aplopes_app/src/pages/auth/components/validator_signup.dart';
import 'package:aplopes_app/src/pages/auth/controller/auth_controller.dart';
import 'package:aplopes_app/src/pages/auth/services/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {

    final cpfFormatter = MaskTextInputFormatter(
      mask: '###.###.###-## ',
      filter: {'#': RegExp(r'[0-9]') }
    );
    final discordTagFormater = MaskTextInputFormatter(
        mask: '#****',
        filter: {'*': RegExp(r'[0-9]') }
    );

    final numberFormatter = MaskTextInputFormatter(
        mask: '(##) # ####-####',
        filter: {'#': RegExp(r'[0-9]') }
    );

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.aplopesBasicColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        'Cadastro',
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                    ),
                  ),
                  //Formulário
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(45),
                        ),
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                           CustomTextField(
                                icon: Icons.email,
                                label: 'Email',
                                onSaved: (value){
                                    authController.user.email = value;
                                },
                                validator: emailValidators,
                                textType: TextInputType.emailAddress),
                          CustomTextField(
                                icon: Icons.person,
                                label: 'Nome Completo',
                                onSaved: (value){
                                  authController.user.name = value;
                                },
                                validator: nameValidators,
                            ),
                            CustomTextField(
                                icon: Icons.phone,
                                label: 'Celular',
                                inputFormatters: [numberFormatter],
                                validator: phoneValidators,
                                onSaved: (value){
                                  authController.user.phone = value;
                                },
                                textType: TextInputType.number),
                            CustomTextField(
                              icon: Icons.file_copy,
                              label: 'Cpf (opcional)',
                              textType: TextInputType.number,
                              onSaved: (value){
                                authController.user.cpf = value;
                              },
                              inputFormatters: [cpfFormatter],
                              validator: cpfValidators,
                            ),
                           CustomTextField(
                                icon: Icons.discord_rounded,
                                label: 'Código discord',
                                inputFormatters:[discordTagFormater],
                                onSaved: (value){
                                 authController.user.discordCode = value;
                                },
                                validator: discordCodeValidators,
                                textType: TextInputType.number),
                           const CustomTextField(
                              icon: Icons.lock,
                              label: 'Senha',
                              isSecret: true,
                             validator: passwordValidators,
                            ),
                            CustomTextField(
                              icon: Icons.lock,
                              label: 'Confirmar senha',
                              validator: passwordConfirmationValidators,
                              onSaved: (value){
                                authController.user.password = value;
                              },
                              isSecret: true,
                            ),
                            SizedBox(
                              height: 50,
                              child:ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18)
                                  )
                                ),
                                  onPressed: authController.isLoadingSignUp.value ? null : (){
                                  FocusScope.of(context).unfocus();
                                  if(_formKey.currentState!.validate()){
                                    _formKey.currentState!.save();
                                    authController.singUp();
                                  }
                                  },
                                  child: authController.isLoadingSignUp.value ?
                                  const CircularProgressIndicator(
                                    color: CustomColors. aplopesBasicColor,
                                  ): const Text('Cadastrar')
                                )
                            )
                          ],
                        ),
                      ),
                  ),
                ],
              ),
              Positioned(
                left: 20,
                top: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon (Icons.arrow_back_ios, color: Colors.white)
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
