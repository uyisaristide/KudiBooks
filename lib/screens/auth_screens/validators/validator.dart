
class Validators {
  static String? validateEmail(String value) {
    final RegExp regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value.isEmpty) {
      return 'Enter email address';
    } else if (!regex.hasMatch(value)) {
      return 'Enter the valid email';
    } else {
      return null;
    }
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Enter password';
    } else if (value.length < 6) {
      return '6 is minimum character for password';
    } else {
      return null;
    }
  }

  static String? validatePin(String value) {
    if (value.toString().isEmpty) {
      return 'Enter Pin';
    } else if (value.toString().length < 4) {
      return 'PIN is 4 digits';
    } else {
      return null;
    }
  }

  static String? validateName(String value) {
    if (value.isEmpty) {
      return 'Enter user name';
    } else if (value.length < 3) {
      return '$value is Invalid';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String value) {
    final RegExp regex = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
    if (value.isEmpty) {
      return 'Phone field is required';
    } else if (!regex.hasMatch(value)) {
      return 'Invalid Phone number';
    } else {
      return null;
    }
  }

  static String? notEmpty(String value) {
    if (value.isEmpty) {
      return "cant't be empty";
    } else {
      return null;
    }
  }
}
