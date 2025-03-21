class LoginModel {
  Future<bool> apiLogin({
    required String email,
    required String password,
  }) async {
    await Future.delayed(Duration(seconds: 3));
    return true;
  }

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
