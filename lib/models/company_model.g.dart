// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompanyModelAdapter extends TypeAdapter<CompanyModel> {
  @override
  final int typeId = 3;

  @override
  CompanyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompanyModel(
      companyId: fields[0] as int,
      companyName: fields[1] as String,
      website: fields[2] as dynamic,
      amIAdmin: fields[3] as int,
      suspendedByKudiBooks: fields[4] as int,
      suspendedByAdmin: fields[5] as int,
      industry: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CompanyModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.companyId)
      ..writeByte(1)
      ..write(obj.companyName)
      ..writeByte(2)
      ..write(obj.website)
      ..writeByte(3)
      ..write(obj.amIAdmin)
      ..writeByte(4)
      ..write(obj.suspendedByKudiBooks)
      ..writeByte(5)
      ..write(obj.suspendedByAdmin)
      ..writeByte(6)
      ..write(obj.industry);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
