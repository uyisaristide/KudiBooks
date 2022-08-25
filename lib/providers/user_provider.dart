import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import '../dio_services.dart';
import '../handle/error_handler.dart';
import '../models/Users/user_model.dart';
import '../models/utilities/network_info.dart';

String? myToken = "";

class UserNotifier extends StateNotifier<NetworkInfo<List<User>>> {
  UserNotifier() : super(NetworkInfo());
  final _dio = Dio();
  String? wrongCred;

  // void addUser(User user) {
  //   state = [...state, user];
  // }

  Future<NetworkInfo> createUserEmail(User user) async {
    state = NetworkInfo(networkStatus: NetworkStatus.loading);
    try {
      Response response = await _dio.post('${DioServices.baseUrl}auth/register',
          data: user.toJsonEmail());
      var info  = NetworkInfo<List<User>>(networkStatus: NetworkStatus.success, statusCode: 200);
      return info;
    } on DioError catch (e) {
      print("${e.response?.data["errors"]}");
      var information = ErrorHandler.handleError<List<User>>(e);
      state=information;
      return information;
    } catch (e) {
      NetworkInfo<List<User>> errorInfo = NetworkInfo(networkStatus: NetworkStatus.error, errorMessage: '${e}');
      return errorInfo;
    }
  }
  Future<NetworkInfo> createUserPhone(User user) async {
    state = NetworkInfo(networkStatus: NetworkStatus.loading);
    try {
      Response response = await _dio.post('${DioServices.baseUrl}auth/register',
          data: user.toJsonPhone());
      var responseInfo = NetworkInfo<List<User>>(networkStatus: NetworkStatus.success, statusCode: 200, );
      return responseInfo;
    } on DioError catch(e){
      print("${e.response?.data["errors"]}");
      var info = ErrorHandler.handleError<List<User>>(e);
      state=info;
      return info;
    } catch(e){
      var errorSpecial = NetworkInfo(networkStatus: NetworkStatus.error, errorMessage: "Contact system admin");
      return errorSpecial;
    }
  }

  Future<NetworkInfo> logout() async {
    state = NetworkInfo(networkStatus: NetworkStatus.loading);
    try {
      debugPrint("Before map: $myToken");
      Map<String, String> mainHeader = {
        "Content-type": "application/json",
        "Authorization": "Bearer ${Hive.box('tokens').get('token')}"
      };

      var logoutResponse = await _dio.get('${DioServices.baseUrl}auth/logout',
          options: Options(headers: mainHeader));

        debugPrint("${logoutResponse.statusCode} logged out successfully");
        debugPrint( "${Hive.box('tokens').get('token')} logged out successfully");
        await Hive.openBox('tokens');
        await Hive.box('tokens').delete('token');
        var successLogout = NetworkInfo<List<User>>(networkStatus: NetworkStatus.success, statusCode: 200);
        state=NetworkInfo(networkStatus: NetworkStatus.success);
        return successLogout;

    } on DioError catch (e) {
      var dioError = ErrorHandler.handleError<List<User>>(e);
      return dioError;
    }catch(e){
      NetworkInfo<List<User>> errorInfo = NetworkInfo(networkStatus: NetworkStatus.error, errorMessage: 'Contact system Admin');
      return errorInfo;
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

  Future<NetworkInfo> loginEmail(String email, String password) async {
    state = NetworkInfo(networkStatus: NetworkStatus.loading);
    try {
      Response loginResponse = await _dio.post('${DioServices.baseUrl}auth/login',
          data: {"email": email, "password": password});
        await Hive.openBox('tokens');
        await Hive.box('tokens').put('token', loginResponse.data["token"]);
        var infoLogin = NetworkInfo<List<User>>(networkStatus: NetworkStatus.success, statusCode: 200);
        return infoLogin;
    } on DioError catch(e){
      print("${e.response?.data['errors']}");
      var informationError = ErrorHandler.handleError<List<User>>(e);
      state=informationError;
      return informationError;
    }
    catch (e) {
      NetworkInfo<List<User>> errorInfo = NetworkInfo(networkStatus: NetworkStatus.error, errorMessage: 'Contact system Admin');
      return errorInfo;
    }
  }

  Future<NetworkInfo> loginPhone( {required String phoneNumber, required String pin}) async {
    state = NetworkInfo(networkStatus: NetworkStatus.loading);
    try {
      var loginResponse = await _dio.post('${DioServices.baseUrl}auth/login',
          data: {"phoneNumber": phoneNumber, "password": pin});
        wrongCred = null;
        await Hive.openBox('tokens');
        Hive.box('tokens').put('token', loginResponse.data["token"]);
        var info = NetworkInfo<List<User>>(networkStatus: NetworkStatus.success, statusCode: 200);
        state = NetworkInfo(networkStatus: NetworkStatus.success);
        return info;
    }on DioError catch(e){
      var info = ErrorHandler.handleError<List<User>>(e);
      state=info;
      return info;
    }catch (e) {
      var infoError = NetworkInfo(networkStatus: NetworkStatus.error);
      return infoError;
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
