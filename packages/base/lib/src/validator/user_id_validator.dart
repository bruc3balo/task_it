
String? userIdValidationError(String? userId) {
  // 1. Check if empty
  if (userId == null || userId.isEmpty) return "User id required";
  final regex = RegExp(
    r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$',
  );
  // 3. Test validity
  final valid = regex.hasMatch(userId);
  if (!valid) return "Invalid uuid";
  return null;
}
