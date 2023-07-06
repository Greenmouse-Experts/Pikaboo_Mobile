import 'package:intl/intl.dart';

extension StringExtensions on String {
  String get capitalizeFirstLetter {
    if (isEmpty) {
      return ''; // Return empty string if the original string is empty
    } else {
      return this[0].toUpperCase();
    }
  }

  String get formatWithCommas {
    final formatter = NumberFormat("#,##0", "en_US");
    final parsedNumber = int.tryParse(this);

    if (parsedNumber != null) {
      return formatter.format(parsedNumber);
    } else {
      return this; // Return the original string if parsing fails
    }
  }
}
