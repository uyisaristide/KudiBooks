// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'user_profile_model.dart';

// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************

// class UserProfileAdapter extends TypeAdapter<UserProfile> {
//   @override
//   final int typeId = 0;

//   @override
//   UserProfile read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return UserProfile(
//       id: fields[0] as int,
//       firstName: fields[1] as String,
//       lastName: fields[2] as String,
//       email: fields[3] as String,
//       provider: fields[4] as String,
//       providerId: fields[5] as String,
//       userName: fields[6] as String,
//       phoneNumber: fields[7] as String,
//       profile: fields[8] as String,
//       emailVerifiedAt: fields[9] as dynamic,
//       emailVerifiedRequired: fields[10] as int,
//       inviterId: fields[11] as dynamic,
//       createdAt: fields[12] as DateTime,
//       updatedAt: fields[13] as DateTime,
//       token: fields[14] as String?,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, UserProfile obj) {
//     writer
//       ..writeByte(15)
//       ..writeByte(0)
//       ..write(obj.id)
//       ..writeByte(1)
//       ..write(obj.firstName)
//       ..writeByte(2)
//       ..write(obj.lastName)
//       ..writeByte(3)
//       ..write(obj.email)
//       ..writeByte(4)
//       ..write(obj.provider)
//       ..writeByte(5)
//       ..write(obj.providerId)
//       ..writeByte(6)
//       ..write(obj.userName)
//       ..writeByte(7)
//       ..write(obj.phoneNumber)
//       ..writeByte(8)
//       ..write(obj.profile)
//       ..writeByte(9)
//       ..write(obj.emailVerifiedAt)
//       ..writeByte(10)
//       ..write(obj.emailVerifiedRequired)
//       ..writeByte(11)
//       ..write(obj.inviterId)
//       ..writeByte(12)
//       ..write(obj.createdAt)
//       ..writeByte(13)
//       ..write(obj.updatedAt)
//       ..writeByte(14)
//       ..write(obj.token);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is UserProfileAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }
