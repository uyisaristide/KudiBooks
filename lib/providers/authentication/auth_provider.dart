import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../dio_services.dart';

import '../../handle/error_handler.dart';
import '../../models/Users/user_model.dart';
import '../../models/utilities/network_info.dart';

class AuthProvider extends StateNotifier<NetworkInfo<List<User>>> {
  AuthProvider() : super(NetworkInfo());
  final Dio _dioInstance = Dio();

  Future<NetworkInfo> requestOTP({required String phoneNumbers}) async {
    state = NetworkInfo(networkStatus: NetworkStatus.loading);
    try {
      var responses = await _dioInstance.post(
          '${DioServices.baseUrl}auth/otp/request',
          data: {"phoneNumber": phoneNumbers});
      var successInfo = NetworkInfo<List<User>>(networkStatus: NetworkStatus.success, statusCode: 200);
      state = NetworkInfo(networkStatus: NetworkStatus.success);
      return successInfo;
    } on DioError catch(e){
      var errorInfo = ErrorHandler.handleError<List<User>>(e);
      return errorInfo;
    } catch (e) {
      NetworkInfo<List<User>> errorInfo = NetworkInfo(networkStatus: NetworkStatus.error, errorMessage: 'Contact system Admin');
      return errorInfo;
    }
  }

  Future<NetworkInfo> verifyOTP(String otpCode, String phoneNumber) async {
    state = NetworkInfo(networkStatus: NetworkStatus.loading);
    try {
      Response response = await _dioInstance.post(
          "${DioServices.baseUrl}auth/otp/verify",
          data: {"code": otpCode, "phoneNumber": phoneNumber});
        var successInfo = NetworkInfo<List<User>>(networkStatus: NetworkStatus.success, statusCode: 200);
        state = NetworkInfo(networkStatus: NetworkStatus.success);
        return successInfo;
    }  on DioError catch(e){
      var errorInfo = ErrorHandler.handleError<List<User>>(e);
      return errorInfo;
    } catch (e) {
      NetworkInfo<List<User>> errorInfo = NetworkInfo(networkStatus: NetworkStatus.error, errorMessage: 'Contact system Admin');
      return errorInfo;
    }
  }

  Future<NetworkInfo> resetPhonePin( {required String otpCode, required String phoneNumber, required String pin, required String confirm_pin}) async {
    state = NetworkInfo(networkStatus: NetworkStatus.loading);
    try {
      Map<String, dynamic> resetData = {
        "otpCode": otpCode,
        "phoneNumber": phoneNumber,
        "password": pin,
        "password_confirmation": confirm_pin
      };
      Response response = await _dioInstance.post(
          '${DioServices.baseUrl}auth/reset-password/phone',
          data: resetData);

      state=NetworkInfo(networkStatus: NetworkStatus.success);
      var successInfo = NetworkInfo<List<User>>(networkStatus: NetworkStatus.success, statusCode: 200);
      return successInfo;
    } on DioError catch(e){
      var errorInfo = ErrorHandler.handleError<List<User>>(e);
      return errorInfo;
    } catch (e) {
      NetworkInfo<List<User>> errorInfo = NetworkInfo(networkStatus: NetworkStatus.error, errorMessage: 'Contact system Admin');
      return errorInfo;
    }
  }

  Future<NetworkInfo> forgotPassword({required String email, required String device}) async {

    try {
      Response response = await _dioInstance.post(
          '${DioServices.baseUrl}auth/forgot-password',
          data: {"email": email, "device": device});

      // state=NetworkInfo(networkStatus: NetworkStatus.success);
      var successInfo = NetworkInfo<List<User>>(networkStatus: NetworkStatus.success, statusCode: 200);
      return successInfo;

    }  on DioError catch(e){
      var errorInfo = ErrorHandler.handleError<List<User>>(e);
      return errorInfo;
    } catch (e) {
      NetworkInfo<List<User>> errorInfo = NetworkInfo(networkStatus: NetworkStatus.error, errorMessage: 'Contact system Admin');
      return errorInfo;
    }
  }

  Future<NetworkInfo> resetEmailPassword( {required String token, required String email, required String password, required String password_confirmation}) async {

    try {
      Map<String, dynamic> resetEmailData = {
        "token": token,
        "email": email,
        "password": password,
        "password_confirmation": password
      };
      Response response = await _dioInstance.post(
          '${DioServices.baseUrl}auth/reset-password/email',
          data: resetEmailData);

      var successInfo = NetworkInfo<List<User>>(networkStatus: NetworkStatus.success, statusCode: 200);
      return successInfo;

    } on DioError catch(e){
      var errorInfo = ErrorHandler.handleError<List<User>>(e);
      return errorInfo;
    } catch (e) {
      NetworkInfo<List<User>> errorInfo = NetworkInfo(networkStatus: NetworkStatus.error, errorMessage: 'Contact system Admin');
      return errorInfo;
    }
  }
}
