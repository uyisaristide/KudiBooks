import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kudibooks_app/models/Users/user_model.dart';

class UserProvider extends StateNotifier<List<User>> {
  UserProvider() : super([]);

  void addUser(User user) {
    state = [...state, user];
  }
}
