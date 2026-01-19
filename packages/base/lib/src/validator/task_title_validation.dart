const int minTitleLength = 3;
const int maxTitleLength = 20;

String? taskTitleValidationError(String? val) {
  // 1. Sanitize: Remove leading/trailing whitespace
  final title = val?.trim();

  // 2. Check Empty
  if (title == null || title.isEmpty) return "Task title is required";

  // 3. Check Length
  if (title.length < minTitleLength) return "Title must be at least $minTitleLength characters";

  if (title.length > maxTitleLength) return "Title must be at most $maxTitleLength characters";

  // 4. Regex Check
  // ^            = Start
  // [a-zA-Z0-9]  = Alphanumeric
  // \s           = Whitespace (allows spaces)
  // \-_          = Allows hyphens and underscores
  // +            = One or more
  // $            = End
  final regex = RegExp(r'^[a-zA-Z0-9\s\-_]+$');

  if (!regex.hasMatch(title)) {
    return "Title can only contain letters, numbers, spaces, hyphens, and underscores";
  }

  return null;
}
