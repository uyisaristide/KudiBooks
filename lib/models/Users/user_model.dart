class User {
  String firstName;
  String lastName;
  String phoneOrEmail;
  String password;

  User({
    required this.firstName,
    required this.lastName,
    required this.phoneOrEmail,
    required this.password,
  });

  factory User.fromJson(Map<dynamic, dynamic> fromJson) => User(
        firstName: fromJson["firstName"],
        lastName: fromJson["lastName"],
        phoneOrEmail: fromJson["email"],
        password: fromJson["password"],
      );

  Map<String, String> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": phoneOrEmail,
      "password": password
    };
  }

  static List<User> listOfUsers() {
    return [];
  }
}
