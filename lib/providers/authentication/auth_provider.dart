import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kudibooks_app/dio_services.dart';

import '../../models/Users/user_model.dart';

class AuthProvider extends StateNotifier<List<User>> {
  AuthProvider() : super([]);
  final Dio _dioInstance = Dio();

  requestOTP({required String phoneNumbers}) async {
    try {
      var responses = await _dioInstance.post(
          '${DioServices.baseUrl}auth/otp/request',
          data: {"phoneNumber": phoneNumbers});
      if (responses.statusCode == 200) {
        return "success";
      } else {
        debugPrint("${responses.statusCode} ${responses.statusMessage}");
        return "fail";
      }
    } catch (error) {
      if (error is DioError) {
        throw error.response?.data['errors'] ?? "$error";
      } else {
        throw Exception(error);
      }
    }
  }

  verifyOTP(String otpCode, String phoneNumber) async {
    try {
      Response response = await _dioInstance.post(
          "${DioServices.baseUrl}auth/otp/verify",
          data: {"code": otpCode, "phoneNumber": phoneNumber});
      if (response.statusCode == 200) {
        debugPrint("${response.statusCode} ${response.statusMessage}");
        return "success";
      } else {
        debugPrint(response.statusMessage);
        return "fail";
      }
    } catch (e) {
      if (e is DioError) {
        debugPrint(e.response?.data["errors"] ?? "error");
        throw e.response?.data["errors"] ?? "error";
      } else {
        throw Exception(e);
      }
    }
  }

  resetPhonePin(
      {required String otpCode,
      required String phoneNumber,
      required String pin,
      required String confirm_pin}) async {
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
      if (response.statusCode == 200) {
        // state = response.data["message"];
        return "success";
      } else {
        return "fail";
      }
    } catch (e) {
      if (e is DioError) {
        debugPrint("${e.response?.data["errors"]}");
        throw e.response?.data["errors"] ?? e;
      } else {
        throw Exception(e);
      }
    }
  }

  forgotPassword({required String email, required String device}) async {
    try {
      Response response = await _dioInstance.post(
          '${DioServices.baseUrl}auth/forgot-password',
          data: {"email": email, "device": device});
      if (response.statusCode == 200) {
        return "success";
      } else {
        return "fail";
      }
    } catch (e) {
      if (e is DioError) {
        debugPrint("${e.response?.data["errors"] ?? e}");
        throw e.response?.data["errors"] ?? e;
      } else {
        throw Exception(e);
      }
    }
  }

  resetEmailPassword(
      {required String token,
      required String email,
      required String password,
      required String password_confirmation}) async {
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
      if (response.statusCode == 200) {
        return 'success';
      } else {
        return "fail";
      }
    } catch (e) {
      if (e is DioError) {
        debugPrint("This is email error: ${e.response?.data["errors"] ?? e}");
        throw "This is email error: ${e.response?.data["errors"] ?? e}";
      } else {
        throw Exception(e);
      }
    }
  }
}
