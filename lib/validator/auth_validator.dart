String? usernameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field is required';
  } else if (value.length < 3) {
    return 'This field must be at least 3 characters';
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field is required';
  } else if (((!value.contains(RegExp(r'[A-Z]'))) &
          !value.contains(RegExp(r'[a-z]'))) |
      !value.contains(RegExp(r'[0-9]'))) {
    return 'You must used letters and numbers';
  }
  return null;
}

String? phoneNumberValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field is required';
  } else if (!value.contains(RegExp(r'^[0-9]+$'))) {
    return 'Please insert a valid phone number';
  } else if (value.length != 12) {
    return 'Please insert a valid length of digits';
  }
  return null;
}

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field is required';
  } else if (value.contains(RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'))) {
    return 'Please enter a valid email address';
  }
  return null;
}
