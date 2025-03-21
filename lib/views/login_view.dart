// views/login_page.dart
import 'package:flutter/material.dart';
import 'package:helloflutter/controllers/login_controller.dart';
import 'package:helloflutter/models/login_model.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email = "";
  String? password = "";
  bool isLoading = false; 

  final formKey = GlobalKey<FormState>();
  late final LoginController loginController;

  @override
  void initState() {
    super.initState();
    loginController = LoginController(loginModel: LoginModel());
  }

  void login() async {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();

      setState(() {
        isLoading = true; 
      });

      await loginController.login(
        email: email!,
        password: password!,
        context: context,
        setState: setState,
      );

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Container(
          color: Colors.white,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Bem-vindo à XP",
                  style: TextStyle(height: 4, fontSize: 24),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                  ),
                  validator: (value) => LoginModel().validateEmail(value),
                  onSaved: (value) => email = value,
                ),
                SizedBox(height: 24),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Senha",
                  ),
                  obscureText: true,
                  validator: (value) => LoginModel().validatePassword(value),
                  onSaved: (value) => password = value,
                ),
                SizedBox(height: 24),
                if (isLoading)
                  CircularProgressIndicator()
                else
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: login,
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        "Entrar",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
