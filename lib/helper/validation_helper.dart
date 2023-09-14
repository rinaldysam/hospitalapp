class ValidationHelper {
  ValidationHelper._();

  static bool isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

    return emailRegex.hasMatch(email);
  }

  static bool isPhoneNumberValid(String phoneNumber) {
    final phoneNumberRegex = RegExp(r'^08\d{8,13}$');

    return phoneNumberRegex.hasMatch(phoneNumber);
  }
}
