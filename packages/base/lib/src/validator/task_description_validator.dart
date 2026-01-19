const int _minDescriptionLength = 10;
const int _maxDescriptionLength = 500;

String? taskDescriptionValidationError(String? val) {
  // 1. Sanitize
  final description = val?.trim();

  // 2. Check Empty
  if (description == null || description.isEmpty) {
    return "Task description is required";
  }

  // 3. Check Minimum Length (Ensure it's descriptive enough)
  if (description.length < _minDescriptionLength) return "Description is too short (min $_minDescriptionLength characters)";


  // 4. Check Maximum Length (Prevent essays)
  if (description.length > _maxDescriptionLength) return "Description is too long (max $_maxDescriptionLength characters)";


  return null;
}