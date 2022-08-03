import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kudibooks_app/dio_services.dart';
import 'package:kudibooks_app/models/Users/user_model.dart';

class UserProvider extends StateNotifier<List<User>> {
  UserProvider() : super([]);

  void addUser(User user) {
    state = [...state, user];
  }

  Future<Response> createUserEmail(User user) async {
    Response responseSaveUser;
    final dio = Dio();
    try {
      responseSaveUser = await dio.post('${DioServices.baseUrl}auth/register',
          data: user.toJsonEmail());
      return responseSaveUser;
    } on DioError catch (e) {
      print('There is error named in this way ${e.response}');
      throw e;
    }
  }

  // Future<Response> loginEmail() {}
  //
  // Future<Response> loginPhone() {}
}
