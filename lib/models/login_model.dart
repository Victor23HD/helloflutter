import 'package:firebase_auth/firebase_auth.dart';

class LoginModel {

  String? validateEmail(String? email) {
    return email != null && email.isNotEmpty ? null : "Email inválido...";
  }

  String? validatePassword(String? password) {
    return password != null && password.length >= 6
        ? null
        : "Senha inválida...";
  }

  bool validateLogin(String email, String password) {
    print("Conectando....");
    print("validando suas credenciais...");
    print("Email $email | Password $password");
    return true;
  }
}
