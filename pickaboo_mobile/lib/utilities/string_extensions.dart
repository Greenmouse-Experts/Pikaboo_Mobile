import 'package:intl/intl.dart';

extension StringExtensions on String {
  String get capitalizeFirstLetter {
    if (isEmpty) {
      return '';
    } else {
      return this[0].toUpperCase();
    }
  }

  String capitalizeFirst() {
    if (isEmpty) {
      return this;
    }
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String get formatWithCommas {
    final formatter = NumberFormat("#,##0.00", "en_US");
    final parsedNumber = double.tryParse(replaceAll(',', ''));

    if (parsedNumber != null) {
      return formatter.format(parsedNumber);
    } else {
      return this;
    }
  }
}

extension DateFormatter on DateTime {
  String get formatedDate {
    DateTime now = this;
    final formattedDate = DateFormat('EEEE, MMM d, yyyy').format(now);

    return formattedDate;
  }
}
