import 'package:flutter/cupertino.dart';
import 'package:kudibooks_app/models/Users/user_model.dart';

class UserProvider extends ChangeNotifier {
  final List<User> _listUser = [];

  List<User> get allUsers => _listUser;

  void addUser(User user) {
    _listUser.add(user);
    notifyListeners();
  }
}
