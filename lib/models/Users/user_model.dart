class User {
  String firstName;
  String lastName;
  String email;
  String password;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<dynamic, dynamic> fromJson) => User(
        firstName: fromJson["firstName"],
        lastName: fromJson["lastName"],
        email: fromJson["email"],
        password: fromJson["password"],
      );

  Map<String, String> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password
    };
  }

  static List<User> listOfUsers() {
    return [];
  }
}
