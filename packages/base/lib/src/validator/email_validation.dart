String? emailValidationError(String? email) {
  if (email == null || email.isEmpty) return "Email required";
  final regex = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final valid = regex.hasMatch(email);
  if(!valid) return "Invalid email";
  return null;
}
