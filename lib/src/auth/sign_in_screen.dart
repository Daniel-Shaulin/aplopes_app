import 'package:aplopes_app/src/auth/components/custom_text_field.dart';
import 'package:aplopes_app/src/auth/sign_up_screen.dart';
import 'package:aplopes_app/src/base/base_screen.dart';
import 'package:aplopes_app/src/config/custom_colors.dart';
import 'package:flutter/material.dart';

class SignInScreen  extends StatelessWidget {
  const SignInScreen ({Key? key}) : super(key: key);

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
                  children: const[

                    Text.rich(TextSpan(
                      style: TextStyle(
                        fontSize: 40,

                      ),
                      children: [
                        TextSpan(
                          text: 'Aplopes',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        TextSpan(
                          text: 'Technology',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        )
                      ]
                    )),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children:[

                    //Email
                    const CustomTextField(
                      icon: Icons.email,
                      label: 'Email',
                    ),

                    //Senha
                    const CustomTextField(
                      icon: Icons.lock,
                      label: 'Senha',
                      isSecret: true,
                    ),

                    //Botão entrar
                    SizedBox(
                      height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)
                            )
                          ),
                            onPressed: (){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (c){
                                return const BaseScreen();
                              }));
                            },
                            child: const Text('Entrar',
                              style: TextStyle(fontSize: 18,
                                  color: Colors.white),)
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
                            Navigator.of(context).push(
                              MaterialPageRoute( builder: (c){
                                    return SignUpScreen();
                                  }),
                            );
                          },
                          child: const Text('Criar conta',
                          style: TextStyle(
                            fontSize: 18
                          ),)),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
