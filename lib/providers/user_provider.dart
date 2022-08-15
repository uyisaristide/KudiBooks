import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kudibooks_app/dio_services.dart';
import 'package:kudibooks_app/models/Users/user_model.dart';

String? myToken;

class UserProvider extends StateNotifier<List<User>> {
  UserProvider() : super([]);
  final _dio = Dio();
  String? wrongCred;

  void addUser(User user) {
    state = [...state, user];
  }

  Future<Response> createUserEmail(User user) async {
    Response response;
    try {
      response = await _dio.post('${DioServices.baseUrl}auth/register',
          data: user.toJsonEmail());
      return response;
    } on DioError catch (e) {
      print('There is error named in this way ${e.response}');
      throw e;
    }
  }

  Future<String?> createUserPhone(User user) async {
    Response response;
    try {
      response = await _dio.post('${DioServices.baseUrl}auth/register',
          data: user.toJsonPhone());
      if (response.statusCode == 200) {
        print(
            "User saved with phone Number: Server message ${response.statusMessage} ${response.statusCode}");
        myToken = response.data["token"];
        return "success";
      } else {
        return "Failed to save with phone";
      }
    } catch (e) {
      if (e is DioError) {
        throw e.response?.data['errors'][0] ?? "Error";
      } else {
        throw Exception(e);
      }
    }
  }

  Future<String?> logout() async {
    Response logoutResponse;
    try {
      debugPrint("Before map: $myToken");
      Map<String, String> mainHeader = {
        "Content-type": "application/json",
        "Authorization": "Bearer $myToken"
      };
      logoutResponse = await _dio.get('${DioServices.baseUrl}auth/logout',
          options: Options(headers: mainHeader));
      if (logoutResponse.statusCode == 200) {
        debugPrint("${logoutResponse.statusCode} logged out successfully");
        debugPrint("$myToken logged out successfully");
        myToken = null;
        return "success";
      }

      return "failed";
    } on DioError catch (e) {
      debugPrint("${e.response}");
    }
  }

  Future<User> loggedUser() async {
    Response user;
    // var headerToken = _dio.options.headers["Authorization"] = "Bearer $myToken";
    user = await _dio.get(
      '${DioServices.baseUrl}app/user',
    );
    User users = User.fromJson(user.data);
    return users;
  }

  Future<String?> loginEmail(String email, String password) async {
    Response loginResponse;
    try {
      loginResponse = await _dio.post('${DioServices.baseUrl}auth/login',
          data: {"email": email, "password": password});
      if (loginResponse.statusCode == 200) {
        wrongCred = null;
        myToken = loginResponse.data["token"];
        return "success";
      }
      wrongCred = "${loginResponse.data['message']}";
      return "fail";
    } catch (e) {
      if (e is DioError) {
        throw e.response?.data['errors'][0] ?? "Error";
      } else {
        throw Exception(e);
      }
    }
  }

  Future<String?> loginPhone(String phoneNumber, String password) async {
    Response loginResponse;
    try {
      loginResponse = await _dio.post('${DioServices.baseUrl}auth/login',
          data: {"email": phoneNumber, "password": password});
      if (loginResponse.statusCode == 200) {
        wrongCred = null;
        myToken = loginResponse.data["token"];
        return "success";
      }
      wrongCred = "${loginResponse.data['message']}";
      return "fail";
    } catch (e) {
      if (e is DioError) {
        throw e.response?.data['errors'][0] ?? "Error";
      } else {
        throw Exception(e);
      }
    }
  }

  Future resetPasswordWithEmail(String email) async {
    Response resetPwdResponse;
    try {
      resetPwdResponse = await _dio.post(
          '${DioServices.baseUrl}auth/forgot-password',
          data: {"email": email});

      if (resetPwdResponse.statusCode == 200) {
        return 'Reset Link sent to your email';
      }
    } catch (e) {
      // print e;
    }
  }
//
// Future<Response> loginPhone() {}
}
