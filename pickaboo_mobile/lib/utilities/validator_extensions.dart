class Validations {
  static String? validPhone(String? val) {
    if (val == null || val.length != 11) {
      return 'Enter an 11 digit phone number';
    }
    return null;
  }

  static String? validOtpPassword(String? value) {
    if (value == null) {
      return 'Enter OTP sent to you';
    }

    if (value.length != 5) {
      return 'OTP must be 5 digit number';
    }

    return null;
  }
}
