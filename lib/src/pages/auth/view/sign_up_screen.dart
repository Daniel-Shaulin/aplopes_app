import 'package:aplopes_app/src/pages/auth/components/custom_text_field.dart';
import 'package:aplopes_app/src/config/custom_colors.dart';
import 'package:aplopes_app/src/pages/auth/components/validator_signup.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final cpfFormatter = MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {'#': RegExp(r'[0-9]') }
    );

    final numberFormatter = MaskTextInputFormatter(
        mask: '(##) #####-####',
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                         const CustomTextField(
                              icon: Icons.email,
                              label: 'Email',
                              textType: TextInputType.emailAddress),
                         const CustomTextField(
                              icon: Icons.person,
                              label: 'Nome Completo'
                          ),
                          CustomTextField(
                              icon: Icons.phone,
                              label: 'Celular',
                              inputFormatters: [numberFormatter],
                              textType: TextInputType.number),
                          CustomTextField(
                            icon: Icons.file_copy,
                            label: 'Cpf',
                            textType: TextInputType.number,
                            inputFormatters: [cpfFormatter],
                          ),
                         const CustomTextField(
                              icon: Icons.discord_rounded,
                              label: 'Código discord',
                              textType: TextInputType.number),
                         const CustomTextField(
                            icon: Icons.lock,
                            label: 'Senha',
                            isSecret: true,
                          ),
                          CustomTextField(
                            icon: Icons.lock,
                            label: 'Confirmar senha',
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
                                onPressed: (){

                                },
                                child: Text('Cadastrar')
                              )
                          )
                        ],
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
