// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model_local.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserEntityLocalAdapter extends TypeAdapter<UserEntityLocal> {
  @override
  final int typeId = 4;

  @override
  UserEntityLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserEntityLocal(
      id: fields[0] as int,
      name: fields[1] as String,
      email: fields[2] as String,
      address: fields[3] as AddressEntityLocal,
      phone: fields[4] as String,
      company: fields[5] as CompanyEntityLocal,
    );
  }

  @override
  void write(BinaryWriter writer, UserEntityLocal obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.company);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntityLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
