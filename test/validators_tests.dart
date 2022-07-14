import 'package:flutter_test/flutter_test.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';

void main() {
  //Test email validation

  group("Email validation test", () {
    var validEmail = Validators.validateEmail("renemucyomucici@gmail.com.com");
    var invalidEmail = Validators.validateEmail("rene.m.com");
    var emptyEmail = Validators.validateEmail("");

    test("valid email example", () {
      expect(validEmail, null);
    });
    test("invalid email", () {
      expect(invalidEmail, "Enter the valid email");
    });
    test("empty value test", () {
      expect(emptyEmail, "Enter email address");
    });
  });

  // Test password

  group("testing password validation", () {
    var emptyPassword = Validators.validatePassword("");
    var shortPassword = Validators.validatePassword("fd");
    var validPassword = Validators.validatePassword("Valid password here");

    test("empty Password", () {
      expect(emptyPassword, "Enter password");
    });
    test("short Password", () {
      expect(shortPassword, "6 is minimum character for password");
    });
    test("valid password", () {
      expect(validPassword, null);
    });
  });

  //Validate pin function

  group("testing valid pin", () {
    var emptyPin = Validators.validatePin("");
    var validLength = Validators.validatePin("1234");
    var invalidPin = Validators.validatePin("123");

    test('empty pin testing', () {
      expect(emptyPin, "Enter Pin");
    });
    test("valid Length", () {
      expect(validLength, null);
    });
    test("invalid pi", () {
      expect(invalidPin, "PIN is 4 digits");
    });
  });

  //Validate name testing

  group("Name field validation", () {
    var isNameEmpty = Validators.validateName("");
    var isNameShort = Validators.validateName("na");
    var isNameValid = Validators.validateName("ValidNames");

    test("Name is empty", () {
      expect(isNameEmpty, "Enter user name");
    });
    test("Name is short", () {
      expect(isNameShort, "na is Invalid");
    });
    test("Name is valid", () {
      expect(isNameValid, null);
    });
  });

  //Phone number validation
  group("phone validation test", () {
    var emptyPhoneNumber = Validators.validatePhoneNumber("");
    var invalidPhoneNumber = Validators.validatePhoneNumber("0787734343432");
    var validPhoneNumber = Validators.validatePhoneNumber("0784494820");

    test("Empty phone number", () {
      expect(emptyPhoneNumber, "Phone field is required");
    });
    test("Invalid phone number", () {
      expect(invalidPhoneNumber, "Invalid Phone number");
    });
    test("valid phone number", () {
      expect(validPhoneNumber, null);
    });
  });
}
