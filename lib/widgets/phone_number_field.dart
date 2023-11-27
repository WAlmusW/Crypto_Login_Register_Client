import 'package:flutter/material.dart';

class PhoneNumberField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const PhoneNumberField({
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
        hintText: "Enter your phone number here",
        labelText: 'Phone Number',
        prefixIcon: Icon(Icons.phone),
      ),
      enableSuggestions: false,
      autocorrect: false,
    );
  }
}
