import 'package:easy_localization/easy_localization.dart';

class Validators {
  static String? validateEmail(String value) {
    final RegExp regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value.isEmpty) {
      return 'validator.email.isEmpty'.tr();
    } else if (!regex.hasMatch(value)) {
      return 'validator.email.isInvalid'.tr();
    } else {
      return null;
    }
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'validator.password.isEmpty'.tr();
    } else if (value.length < 6) {
      return 'validator.password.matchLength'.tr();
    } else {
      return null;
    }
  }

  static String? validatePin(String value) {
    if (value.toString().isEmpty) {
      return 'validator.validatePin.isEmpty'.tr();
    } else if (value.toString().length < 4) {
      return 'validator.validatePin.matchLength'.tr();
    } else {
      return null;
    }
  }

  static String? validateName(String value) {
    if (value.isEmpty) {
      return 'validator.validateName.isEmpty'.tr();
    } else if (value.length < 3) {
      return 'createAccountPhone.validate.name'.tr(args: [value]);
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String value) {
    final RegExp regex = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
    if (value.isEmpty) {
      return 'validator.validatePhoneNumber.phoneIsRequired'.tr();
    } else if (!regex.hasMatch(value)) {
      return 'validator.validatePhoneNumber.invalidPhone'.tr();
    } else {
      return null;
    }
  }

  static String? notEmpty(String value) {
    if (value.isEmpty) {
      return "can't be empty";
    } else {
      return null;
    }
  }
}
