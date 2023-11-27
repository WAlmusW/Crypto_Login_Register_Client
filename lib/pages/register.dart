import 'package:flutter/material.dart';

import 'package:crypto_login_register/validator/auth_validator.dart';
import 'package:crypto_login_register/routes/app_routes.dart';
import 'package:crypto_login_register/component/authentication/register_user.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _username;
  late final TextEditingController _password;
  late final TextEditingController _email;
  late final TextEditingController _phone_number;

  @override
  void initState() {
    _username = new TextEditingController();
    _password = new TextEditingController();
    _email = new TextEditingController();
    _phone_number = new TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    _email.dispose();
    _phone_number.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _username,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: usernameValidator,
                decoration: InputDecoration(
                  hintText: "Enter your username here",
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person),
                ),
                enableSuggestions: false,
                autocorrect: false,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _password,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: passwordValidator,
                decoration: InputDecoration(
                  hintText: "Enter your password here",
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _email,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: emailValidator,
                decoration: InputDecoration(
                  hintText: "Enter your email here",
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.mail),
                ),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _phone_number,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: phoneNumberValidator,
                decoration: InputDecoration(
                  hintText: "Enter your phone_number here",
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone),
                ),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                onPressed: () async {
                  final username = _username.text;
                  final password = _password.text;
                  final email = _email.text;
                  final phone_number = _phone_number.text;

                  try {
                    RegisterService.registerUser(
                        username, password, email, phone_number);
                    Navigator.pushNamed(context, AppRoutes.dashboardPage);
                  } catch (e) {
                    print("Register failed");
                  }
                },
                child: const Text(
                  'Register',
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
