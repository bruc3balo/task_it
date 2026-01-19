const minDisplayNameLength = 3;
const maxDisplayNameLength = 20;

String? displayNameValidationError(String? displayName) {
  // 1. Check if empty
  if (displayName == null || displayName.isEmpty) {
    return "Display name is required";
  }

  int length = displayName.length;
  if (length < minDisplayNameLength) return "Display name must be a minimum of $minDisplayNameLength characters";
  if (length > maxDisplayNameLength) return "Display name must be a maximum of $maxDisplayNameLength characters";

  // 2. Define the Regex
  // ^       = Start of string
  // [a-zA-Z0-9] = Any letter (case insensitive) or number
  // +       = One or more times
  // $       = End of string
  // Note: If you want to allow spaces, add a space inside the brackets: [a-zA-Z0-9 ]
  final regex = RegExp(r'^[a-zA-Z0-9]+$');

  // 3. Test validity
  final valid = regex.hasMatch(displayName);

  if (!valid) return "Display name must contain only letters and numbers";

  return null;
}
