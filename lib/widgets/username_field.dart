import 'package:flutter/material.dart';

class UsernameField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const UsernameField({
    Key? key,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      decoration: InputDecoration(
        hintText: "Enter your username here",
        labelText: 'Username',
        prefixIcon: Icon(Icons.email),
      ),
      enableSuggestions: false,
      autocorrect: false,
    );
  }
}
