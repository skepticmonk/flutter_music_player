String? validateForm(value) {
  if (value == null || value.isEmpty) {
    return 'The above field is required';
  }
  return null;
}

String? validateEmail(value) {
  if (value == null || value.isEmpty) {
    return 'The above field is required';
  } else if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value)) {
    return 'Invalid Email';
  }
  return null;
}
