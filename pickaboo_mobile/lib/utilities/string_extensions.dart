extension StringExtensions on String {
  String get capitalizeFirstLetter {
    if (isEmpty) {
      return ''; // Return empty string if the original string is empty
    } else {
      return this[0].toUpperCase();
    }
  }
}
