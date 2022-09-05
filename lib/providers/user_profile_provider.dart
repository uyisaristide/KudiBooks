import 'dart:core';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../dio_services.dart';
import 'package:kudibooks_app/models/Users/user_profile_model.dart';
import 'package:kudibooks_app/providers/user_provider.dart';

import '../main.dart';
import '../models/utilities/network_info.dart';

String? haveToke;
// var miProfile;

// bool isLogged = false;

class UserProfileNotifier extends StateNotifier<NetworkInfo<UserProfile>> {
  UserProfileNotifier() : super(NetworkInfo());

  final dio = Dio();

  var userProfileBox;

  UserProfile? miProfile;

  UserProfile? currentUser;

  // late var amOut;

  Future getUserProfile() async {
    Response profileResponse;
    state = NetworkInfo(networkStatus: NetworkStatus.loading);

    try {
      Map<String, String> mainHeader = {
        "Content-type": "application/json",
        "Authorization": "Bearer $myToken"
      };

      profileResponse = await dio.get('${DioServices.baseUrl}app/user',
          options: Options(headers: mainHeader));
      // print(profileResponse.data);
      var userProfile = UserProfile.fromJson(profileResponse.data);

      var info = NetworkInfo<UserProfile>(
          statusCode: 200,
          networkStatus: NetworkStatus.success,
          data: userProfile);

      miProfile = info.data;
      // print(mainHeader);

      state = info;
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
    } catch (e) {
      NetworkInfo<UserProfile> info = NetworkInfo();
      info.errorMessage = "";
    }
  }

  Future addLoggedUserToHive() async {
    // userProfileBox = await Hive.openBox<UserProfile?>(userProfileBoxName);
    userProfileBox = Hive.box(userProfileBoxName);
    await userProfileBox.put('user', miProfile);
  }

  Future<UserProfile?> getUserFromHive() async {
    // userProfileBox = await Hive.openBox<UserProfile?>(userProfileBoxName);
    userProfileBox = Hive.box(userProfileBoxName);
    currentUser = userProfileBox.get('user');

    return currentUser;
  }

  Future deleUserFromHive() async {
    userProfileBox = Hive.box(userProfileBoxName);
    await userProfileBox.clear();
  }
  // Future deleteUser
}

//   Future loggout() async {
//     int getout = await userProfileBox.clear();
//     print('delete from hive gave response:$getout');
//     return getout;
//   }
// }







// import 'dart:math';

// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:hive/hive.dart';
// import 'package:kudibooks_app/dio_services.dart';
// import 'package:kudibooks_app/main.dart';
// import 'package:kudibooks_app/models/Users/user_profile_model.dart';
// import 'package:kudibooks_app/providers/user_provider.dart';

// String? haveToke;
// var miProfile;

// // bool isLogged = false;

// class UserProfileNotifier extends StateNotifier<List<UserProfile>> {
//   UserProfileNotifier() : super([]);

//   final dio = Dio();

//   late Box<UserProfile?> userProfileBox;

//   UserProfile? myUserProfile ;

//   late var amOut;

//   Future<dynamic> getUserProfile() async {
//     Response profileResponse;

//     Map<String, String> mainHeader = {
//       "Content-type": "application/json",
//       "Authorization": "Bearer $myToken"
//     };

//     try {
//       profileResponse = await dio.get('${DioServices.baseUrl}app/user',
//           options: Options(headers: mainHeader));
//       if (profileResponse.statusCode == 200) {
//         var currentUser = profileResponse.data;

//         UserProfile user = UserProfile.fromJson(profileResponse.data);

//         userProfileBox = await Hive.openBox<UserProfile>(userProfileBoxName);
        
//         userProfileBox.put('user', user);

//         // miProfile = userProfileBox;
//         // myUserProfile = userProfileBox.get('user');
        

//         // if (userProfileBox.isNotEmpty) {
//         //   isLogged = true;
//         // }

//         // print(
//         //     'we now have : ${myUserProfile!.firstName} with token : ${myUserProfile!.token}');

//         // return openBox;
//       } else {
//         return 'failed with error $e';
//       }
//     } catch (e) {
//       if (e is DioError) {
//         throw e.response?.data['errors'][0] ?? "Error";
//       } else {
//         throw Exception(e);
//       }
//     }
//   }

//   Future <void> getPro() async {
//     userProfileBox = await Hive.openBox<UserProfile>(userProfileBoxName);
//     myUserProfile = userProfileBox.get('user');

   
//   }

//  loggout() async {
//     await userProfileBox.clear();
//     print('deleted in hive:');
    
//   }
// }
