import 'package:get/get.dart';


String? passwordValidate;

String? emailValidators(String? email) {
  if (email == null || email.isEmpty) return 'Digite seu email';
  if (!email.isEmail) return 'Digite um email válido';
  return null;
}

String? passwordValidators(String? password) {
  if (password == null || password.isEmpty) return 'Digite sua senha';

  if (password.length < 8) return 'A senha deve ter pelo menos 8 caractéres';
  passwordValidate = password;
  return null;
}

String? nameValidators(String? name) {
  if (name == null || name.isEmpty) return 'Digite seu nome';
  if(name.split(' ').length < 2) return 'Nome deve ser composto';

  return null;
}

String? phoneValidators(String? phone) {
  if (phone == null || phone.isEmpty) return 'Digite seu celular';
  if(phone.length < 14 || !phone.isPhoneNumber) return 'Número inválido';
  return null;
}

String? cpfValidators(String? cpf) {
  if(cpf != null && !cpf.isBlank! && !cpf.isCpf) return 'Cpf inválido';
  return null;
}

String? discordCodeValidators(String? discordCode) {
  if (discordCode == null || discordCode.isEmpty) return 'Digite seu código ou tag';
  return null;
}

String? passwordConfirmationValidators(String? password){
  if(passwordValidate != password) return 'As senhas não coincidem';
  return null;
}
