import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kudibooks_app/models/Users/user_model.dart';

import '../dio_services.dart';

final userProvider =
    StateNotifierProvider<UserProvider, List<User>>((ref) => UserProvider());

class UserProvider extends StateNotifier<List<User>> {
  UserProvider() : super([]);
  final Dio dio = Dio();

  void addUser(User user) {
    state = [...state, user];
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

  // Future<Response> loginEmail() {}
  //
  // Future<Response> loginPhone() {}
}
