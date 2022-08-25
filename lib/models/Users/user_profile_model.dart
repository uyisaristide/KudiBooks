
// import 'dart:core';



// import 'package:hive/hive.dart';
// import '../../providers/user_provider.dart';

// part 'user_profile_model.g.dart';

// @HiveType(typeId: 0)
// class UserProfile {
//   UserProfile({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.email,
//     required this.provider,
//     required this.providerId,
//     required this.userName,
//     required this.phoneNumber,
//     required this.profile,
//     this.emailVerifiedAt,
//     required this.emailVerifiedRequired,
//     this.inviterId,
//     required this.createdAt,
//     required this.updatedAt,
//     this.token,
//   });
  
//   @HiveField(0)
//   int id;

//   @HiveField(1)
//   String firstName;

//   @HiveField(2)
//   String lastName;

//   @HiveField(3)
//   String email;

//   @HiveField(4)
//   String provider;

//   @HiveField(5)
//   String providerId;

//   @HiveField(6)
//   String userName;

//   @HiveField(7)
//   String phoneNumber;

//   @HiveField(8)
//   String profile;

//   @HiveField(9)
//   dynamic emailVerifiedAt;

//   @HiveField(10)
//   int emailVerifiedRequired;

//   @HiveField(11)
//   dynamic inviterId;

//   @HiveField(12)
//   DateTime createdAt;

//   @HiveField(13)
//   DateTime updatedAt;

//   @HiveField(14)
//   String? token;

//   factory UserProfile.fromJson(Map<dynamic, dynamic> json) => UserProfile(
//       id: json["id"],
//       firstName: json["firstName"],
//       lastName: json["lastName"],
//       email: json["email"] ?? '',
//       provider: json["provider"] ?? '',
//       providerId: json["provider_id"] ?? '',
//       userName: json["userName"] ?? '',
//       phoneNumber: json["phoneNumber"] ?? '',
//       profile: json["profile"] ?? '',
//       emailVerifiedAt: json["email_verified_at"] ?? '',
//       emailVerifiedRequired: json["email_verified_required"] ?? '',
//       inviterId: json["inviterID"] ?? '',
//       createdAt: DateTime.parse(json["created_at"] ?? ''),
//       updatedAt: DateTime.parse(json["updated_at"] ?? ''),
//       token: myToken??'');

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "firstName": firstName,
//         "lastName": lastName,
//         "email": email,
//         "provider": provider,
//         "provider_id": providerId,
//         "userName": userName,
//         "phoneNumber": phoneNumber,
//         "profile": profile,
//         "email_verified_at": emailVerifiedAt,
//         "email_verified_required": emailVerifiedRequired,
//         "inviterID": inviterId,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }
// // UserProfile userProfileFromJson(String str) => UserProfile.fromJson(json.decode(str));

// // String userProfileToJson(UserProfile data) => json.encode(data.toJson());