const minPasswordLength = 3;
const maxPasswordLength = 64;

String? passwordValidationError(String? password) {
  // 1. Check if empty
  if (password == null || password.isEmpty) {
    return "Password is required";
  }

  final length = password.length;

  if (length < minPasswordLength) {
    return "Password must be at least $minPasswordLength characters";
  }

  if (length > maxPasswordLength) {
    return "Password must be at most $maxPasswordLength characters";
  }

  // 2. Define rules
  final hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
  final hasLowercase = RegExp(r'[a-z]').hasMatch(password);
  final hasDigit = RegExp(r'[0-9]').hasMatch(password);
  final hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);

  // 3. Validate rules
  if (!hasUppercase) {
    return "Password must contain at least one uppercase letter";
  }

  if (!hasLowercase) {
    return "Password must contain at least one lowercase letter";
  }

  if (!hasDigit) {
    return "Password must contain at least one number";
  }

  if (!hasSpecialChar) {
    return "Password must contain at least one special character";
  }

  return null; // Valid password
}