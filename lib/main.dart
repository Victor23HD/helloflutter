void main() {
  String email = "xitornet.23@icloud.com";
  String password = "Senha123";
  final isValid = validate(email: email, password: password);

  if (isValid == null) {
    login(email: email, password: password);
  } else {
    print(isValid);
  }
}

void login({required String email, required String password}) {
  final response = validateLogin(email: email, password: password);

  if(response == true){
    print("Abrindo a HomePage");
  }
}

String? validate({required email, required String password}) {
  final emailIsValid = validateEmail(email: email);
  final passwordIsValid = validatePassword(password: password);

  if (emailIsValid == false) {
    return "the email is not valid";
  } else if (passwordIsValid == false) {
    return "the password is not valid";
  }

  return null;
}

bool validateEmail({required String email}) {
  // ignore: unnecessary_null_comparison
  return email != null && email.length > 0;
}

bool validatePassword({required String password}) {
  // ignore: unnecessary_null_comparison
  return password != null && password.length >= 6;
}

bool validateLogin({required String email, required String password}) {
  print("Conectando....");
  print("validando suas credenciais...");

  return true;
}
