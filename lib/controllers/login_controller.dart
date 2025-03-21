// controller/login_controller.dart
import 'package:flutter/material.dart';
import 'package:helloflutter/models/login_model.dart';

class LoginController {
  final LoginModel loginModel;

  LoginController({required this.loginModel});

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
    required Function setState,
  }) async {
    setState(() {
    });

    final isValid = validateLogin(email, password);
    if (isValid) {
      final response = await loginModel.apiLogin(email: email, password: password);
      setState(() {
      });

      if (response) {
        Navigator.pushNamed(context, "/home");
      }
    } else {
      setState(() {
      });
    }
  }

  bool validateLogin(String email, String password) {
    print("Conectando....");
    print("validando suas credenciais...");
    print("Email $email | Password $password");
    return true;
  }
}
