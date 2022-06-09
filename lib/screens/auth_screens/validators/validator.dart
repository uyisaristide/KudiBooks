class Varidators{
  static String? validateEmail(String value) {
    final RegExp regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value.isEmpty) {
      return 'enter email address';
    } else if (!regex.hasMatch(value)) {
      return 'Enter the valid email';
    } else {
      return null;
    }
  }
  static String? validatePassword(String value){
    if (value.isEmpty) {
      return 'enter password';
    } else if (value.length <6) {
      return 'the password might have atleast 6 characters';
    } else {
      return null;
    }
  }
  static String? validateName(String value){
    if (value.isEmpty) {
      return 'enter user name';
    } else if (value.length <3) {
      return 'this name is Invalid';
    } else {
      return null;
    }
  }
  static String? validatePhoneNumber(String value) {
    final RegExp regex = RegExp(
        r'(^(?:[+0]9)?[0-9]{10,12}$)');
    if (value.isEmpty) {
      return 'enter Phone';
    } else if (!regex.hasMatch(value)) {
      return 'Invalid Phone number';
    } else {
      return null;
    }
  }

}