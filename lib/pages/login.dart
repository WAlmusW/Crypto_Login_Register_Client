import 'package:flutter/material.dart';

import 'package:crypto_login_register/validator/auth_validator.dart';
import 'package:crypto_login_register/routes/app_routes.dart';
import 'package:crypto_login_register/widgets/username_field.dart';
import 'package:crypto_login_register/widgets/password_field.dart';
import 'package:crypto_login_register/component/authentication/login_user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _username;
  late final TextEditingController _password;

  @override
  void initState() {
    _username = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              UsernameField(
                controller: _username,
                validator: usernameValidator,
              ),
              SizedBox(height: 20),
              PasswordField(
                  controller: _password, validator: passwordValidator),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                onPressed: () async {
                  final username = _username.text;
                  final password = _password.text;

                  try {
                    print(username + " " + password);
                    LoginService.loginUser(username, password, (isLoggedIn) {
                      if (isLoggedIn) {
                        print('Login successful $isLoggedIn');
                        Navigator.pushNamed(context, AppRoutes.dashboardPage);
                      } else {
                        print(
                            'Login failed. Check your username and password.');
                      }
                    });
                  } catch (e) {
                    print("Login failed. Check your username and password");
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
