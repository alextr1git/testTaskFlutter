// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model_local.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressEntityLocalAdapter extends TypeAdapter<AddressEntityLocal> {
  @override
  final int typeId = 1;

  @override
  AddressEntityLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddressEntityLocal(
      street: fields[0] as String,
      suite: fields[1] as String,
      city: fields[2] as String,
      zipcode: fields[3] as String,
      geo: fields[5] as GeoEntityLocal,
    );
  }

  @override
  void write(BinaryWriter writer, AddressEntityLocal obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.street)
      ..writeByte(1)
      ..write(obj.suite)
      ..writeByte(2)
      ..write(obj.city)
      ..writeByte(3)
      ..write(obj.zipcode)
      ..writeByte(5)
      ..write(obj.geo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressEntityLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
