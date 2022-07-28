class User {
  int? id;
  String firstName;
  String lastName;
  String? phoneOrEmail;
  String? email;
  String password;
  String? passwordConfirm;

  User(
      {this.id,
      required this.firstName,
      required this.lastName,
      this.phoneOrEmail,
      required this.password,
      this.email,
      this.passwordConfirm});

  factory User.fromJson(Map<dynamic, dynamic> fromJson) => User(
        id: fromJson["id"],
        firstName: fromJson["firstName"],
        lastName: fromJson["lastName"],
        phoneOrEmail: fromJson["email"],
        password: fromJson["password"],
        passwordConfirm: fromJson["password_confirmation"],
        email: fromJson["email"],
      );

  Map<String, String> toJson() {
    return {
      "id": id.toString(),
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneOrEmail.toString(),
      "password": password,
      "password_confirmation": password,
    };
  }
  Map<String, String> toJsonEmail() {
    return {
      "id": id.toString(),
      "firstName": firstName,
      "lastName": lastName,
      "password": password,
      "password_confirmation": password,
      "email": email.toString()
    };
  }

  static List<User> listOfUsers() {
    return [];
  }
}
