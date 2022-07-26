import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:kudibooks_app/models/Users/user_model.dart';

import '../dio_services.dart';

class UserProvider extends ChangeNotifier {
  final Dio dio = Dio();
  final List<User> _listUser = [];

  List<User> _listFromJson(List<dynamic> lists) =>
      List<User>.from(lists.map((e) => User.fromJson(e)));

  List<User> get allUsers => _listUser;

  static final UserProvider userProviderInstance = UserProvider();

  void addUser(User user) {
    _listUser.add(user);
    notifyListeners();
  }

  Future<Response> createUser(User user) async {
    try {
      Response responseSaveUser;
      responseSaveUser = await dio.post(DioServices.baseUrl + 'auth/register',
          data: user.toJson());
      return responseSaveUser;
    } on DioError catch (e) {
      print('There is error named in this way ${e.response}');
      throw e;
    }
  }

  Future<Response> createUserEmail(User user) async {
    Response responseSaveUser;
    try {
      responseSaveUser = await dio.post(DioServices.baseUrl + 'auth/register',
          data: user.toJsonEmail());
      return responseSaveUser;
    } on DioError catch (e) {
      print('There is error named in this way ${e.response}');
      throw e;
    }
  }
}
