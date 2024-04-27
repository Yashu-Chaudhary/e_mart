// Custom exception class to handle various format-related errors.
class PFormatExcepton implements Exception {
  // THe associated error message.
  final String message;

  // Default constructor with a generic error messsage.
  const PFormatExcepton(
      [this.message =
          'An unexpected format error occurred. Please check your input.']);

  // Create a format exception froma a specific error message.
  factory PFormatExcepton.fromMessage(String message) {
    return PFormatExcepton(message);
  }

  // Get the corresponding error message.
  String get formattedMessage => message;

  // Create a format exception from a specific error code.
  factory PFormatExcepton.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const PFormatExcepton(
            'The email address format is invlaid. Please enter a vlaid email.');
      case 'invalid-phone-number-format':
        return const PFormatExcepton('The provided phone number format is invlaid. Please enter a valid number.');
      case 'invalid-date-format':
        return const PFormatExcepton('THe date formate is invalid. Please enter a valid date.');
      case 'invalid-url-format':
        return const PFormatExcepton('The URL format is invalid. Please enter a vlaid URL.');
      case 'invalid-credit-card-format':
        return const PFormatExcepton('The credit card format is invalid. Please enter a valid Credit card number.');
      case 'invalid-numeric-format':
        return const PFormatExcepton('The input should be a valid numeric format.');
      default:
        return  PFormatExcepton('Format exception $code');
    }
  }
}
