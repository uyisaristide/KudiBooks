import 'dart:core';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../dio_services.dart';
import 'package:kudibooks_app/models/Users/user_profile_model.dart';
import 'package:kudibooks_app/providers/user_provider.dart';

import '../main.dart';
import '../models/utilities/network_info.dart';
import 'all_providers_list.dart';

String? haveToke;
// var miProfile;

// bool isLogged = false;

class UserProfileNotifier extends StateNotifier<NetworkInfo<UserProfile>> {
  UserProfileNotifier(this.ref) : super(NetworkInfo());
  Ref ref;
  final dio = Dio();

  // late var amOut;

  Future<NetworkInfo<UserProfile>> getUserProfile(token) async {
    Response profileResponse;
    state = NetworkInfo(networkStatus: NetworkStatus.loading);

    try {
      Map<String, String> mainHeader = {
        "Content-type": "application/json",
        "Authorization": "Bearer $token"
      };

      profileResponse = await dio.get('${DioServices.baseUrl}app/user',
          options: Options(headers: mainHeader));
      print(profileResponse.data);
      var userProfile = UserProfile.fromJson(profileResponse.data);

      var info = NetworkInfo<UserProfile>(
          statusCode: 200,
          networkStatus: NetworkStatus.success,
          data: userProfile);
      addLoggedUserToHive(userProfile);
      state = info;
      return info;
    } on DioError catch (e) {
      NetworkInfo<UserProfile> info =
          NetworkInfo(networkStatus: NetworkStatus.failed);
      switch (e.type) {
        case DioErrorType.connectTimeout:
          // TODO: Handle this case.
          info.errorMessage = "Connection error, check your internet";
          break;
        case DioErrorType.sendTimeout:
          // TODO: Handle this case.
          info.errorMessage = "Check connection, before send data";
          break;
        case DioErrorType.receiveTimeout:
          // TODO: Handle this case.
          info.errorMessage = "Slow network";
          break;
        case DioErrorType.response:
          // TODO: Handle this case.
          info = NetworkInfo<UserProfile>.errors(e.response?.data ?? {},
              statusCode: e.response!.statusCode, status: NetworkStatus.failed);
          break;
        case DioErrorType.cancel:
          // TODO: Handle this case.
          info = NetworkInfo(errorMessage: "Reconnect your internet");
          break;
        case DioErrorType.other:
          // TODO: Handle this case.
          info = NetworkInfo(errorMessage: "Check your internet");
          break;
      }

      return info;
    } catch (e) {
      NetworkInfo<UserProfile> info = NetworkInfo();
      info.errorMessage = "$e";
      return info;
    }
  }

  bool isLogged() {
    var userProfileBox = Hive.box(userProfileBoxName);
    var logged = userProfileBox.containsKey('user');
    var user = getUserFromHive();
    print(user);
    var companies;
    if (user != null) {
      companies =
          ref.read(companyListProvider.notifier).getCompaniesList(user.token);
    }
    print(companies);
    return logged;
  }

  Future addLoggedUserToHive(user) async {
    var userProfileBox = Hive.box(userProfileBoxName);
    await userProfileBox.put('user', user);
  }

  UserProfile? getUserFromHive() {
    var userProfileBox = Hive.box(userProfileBoxName);
    var currentUser = userProfileBox.get('user');
    var user = currentUser;
    print("user prof ${currentUser}");
    ref.read(companyListProvider.notifier).getCompaniesList(user);
    ref.read(companyProvider.notifier).getCompanyFromHive();

    return currentUser;
  }

  Future deleUserFromHive() async {
    var userProfileBox = Hive.box(userProfileBoxName);
    await userProfileBox.clear();
  }
}

class SavedUserNotifier extends StateNotifier<UserProfile> {
  final UserProfile _profile;
  SavedUserNotifier(this._profile) : super(_profile);
}
