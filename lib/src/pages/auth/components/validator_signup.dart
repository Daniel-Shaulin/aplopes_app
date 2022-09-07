import 'package:flutter/foundation.dart';

abstract class ValidatorSignup{


  static String validPassword(String password){
    if(password == null || password.isEmpty) return 'Digite sua senha';

    if(password.length < 8) return 'A senha deve ter pelo menos 8 caractéres';
    return '';
  }



}