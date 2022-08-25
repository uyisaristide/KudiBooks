import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:kudibooks_app/dio_services.dart';
import 'package:kudibooks_app/main.dart';
import 'package:kudibooks_app/models/Users/user_profile_model.dart';
import 'package:kudibooks_app/providers/user_provider.dart';

String? haveToke;
var miProfile;

// bool isLogged = false;

class UserProfileNotifier extends StateNotifier<List<UserProfile>> {
  UserProfileNotifier() : super([]);

  final dio = Dio();

  late Box<UserProfile?> userProfileBox;

  UserProfile? myUserProfile;

  late var amOut;

  Future<dynamic> getUserProfile() async {
    Response profileResponse;

    Map<String, String> mainHeader = {
      "Content-type": "application/json",
      "Authorization": "Bearer $myToken"
    };

    try {
      profileResponse = await dio.get('${DioServices.baseUrl}app/user',
          options: Options(headers: mainHeader));
      if (profileResponse.statusCode == 200) {
        // var currentUser = profileResponse.data;

        UserProfile user = UserProfile.fromJson(profileResponse.data);

        userProfileBox = await Hive.openBox<UserProfile>(userProfileBoxName);

         await userProfileBox.put('user', user);
        
        // miProfile = userProfileBox;
        myUserProfile = userProfileBox.get('user');

        // haveToke = myUserProfile!.token;

        // if (userProfileBox.isNotEmpty) {
        //   isLogged = true;
        // }

        print(
            'we now have : ${myUserProfile!.firstName} with token : ${myUserProfile!.token}');

        return user;
      } else {
        return 'failed with error $e';
      }
    } catch (e) {
      if (e is DioError) {
        throw e.response?.data['errors'][0] ?? "Error";
      } else {
        throw Exception(e);
      }
    }
  }

  Future loggout() async {
    int getout = await userProfileBox.clear();
    print('delete from hive gave response:$getout');
    return getout;
  }
}







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
