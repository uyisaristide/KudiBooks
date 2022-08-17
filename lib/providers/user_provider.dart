import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kudibooks_app/dio_services.dart';
import 'package:kudibooks_app/models/Users/user_model.dart';

String? myToken = "";

class UserProvider extends StateNotifier<List<User>> {
  UserProvider() : super([]);
  final _dio = Dio();
  String? wrongCred;

  void addUser(User user) {
    state = [...state, user];
  }

  createUserEmail(User user) async {
    Response response;
    try {
      response = await _dio.post('${DioServices.baseUrl}auth/register',
          data: user.toJsonEmail());
      if (response.statusCode == 200) {
        return "success";
      } else {
        return "fail";
      }
    } catch (e) {
      if (e is DioError) {
        debugPrint("${e.response?.data["errors"]} is an error");
        throw e.response?.data["errors"] ?? e;
      } else {
        throw Exception(e);
      }
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

  Future logout() async {
    Response logoutResponse;
    try {
      debugPrint("Before map: $myToken");
      Map<String, String> mainHeader = {
        "Content-type": "application/json",
        "Authorization": "Bearer ${Hive.box('tokens').get('token')}"
      };
      logoutResponse = await _dio.get('${DioServices.baseUrl}auth/logout',
          options: Options(headers: mainHeader));
      if (logoutResponse.statusCode == 200) {
        debugPrint("${logoutResponse.statusCode} logged out successfully");
        debugPrint("${Hive.box('tokens').get('token')} logged out successfully");
        await Hive.openBox('tokens');
        await Hive.box('tokens').delete('token');
        return "success";
      }
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
        await Hive.openBox('tokens');
        await Hive.box('tokens').put('token', loginResponse.data["token"]);
        myToken = loginResponse.data["token"];

        return "success";
      }
      wrongCred = "${loginResponse.data['message']}";
      return "fail";
    } catch (e) {
      if (e is DioError) {
        debugPrint("Login email error: ${e.response?.data["message"]}");
        throw e.response?.data['errors'] ?? e;
      } else {
        throw Exception(e);
      }
    }
  }

  Future<String?> loginPhone(
      {required String phoneNumber, required String pin}) async {
    Response loginResponse;
    try {
      loginResponse = await _dio.post('${DioServices.baseUrl}auth/login',
          data: {"phoneNumber": phoneNumber, "password": pin});
      if (loginResponse.statusCode == 200) {
        wrongCred = null;
        await Hive.openBox('tokens');
        Hive.box('tokens').put('token', loginResponse.data["token"]);
        // Hive.box('tokens').put('token', '211|fypwIaljfZhLkrRzINT25vr2omXSXmG5wksFl53w');
        myToken = loginResponse.data["token"];
        return "success";
      }
      wrongCred = "${loginResponse.data['message']}";
      return "fail";
    } catch (e) {
      if (e is DioError) {
        print(e.response?.data["message"]);
        throw e.response?.data['errors'] ?? "Error $e";
      } else {
        throw Exception(e);
      }
    }
  }
//
// Future<Response> loginPhone() {}
}
