// Custom excepton class to handle various Firebase-related errors.
class PFirebaseException implements Exception {
  // The error code associated with the exception.
  final String code;

  // Constructor that takes an error code.
  PFirebaseException(this.code);

  // Get the corresponding error message based on the error code.
  String get message {
    switch (code) {
      case 'unknown':
        return 'An unknown Firebase error occurred. Please try agin.';
      case 'invalid-custom-token':
        return 'The custom token format is incorrect. Please check your custom taken.';
      case 'custom-token-mismatch':
        return 'The custom token corresponds to a differnt audience.';
      case 'user-disabled':
        return 'The user account has been disabled.';
      case 'user-not-found':
        return 'No user found for the given email or UID.';
      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email.';
      case 'email-already-in-use':
        return 'The email address is already registered. Please use a different email.';
      case 'worng-password':
        return 'Incorrect password. Please check your password and try again.';
      case 'weak-password':
        return 'Incorrect password. Please choose astrong password.';
      default:
        return '';
    }
  }
}
