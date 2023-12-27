// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_model_local.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GeoEntityLocalAdapter extends TypeAdapter<GeoEntityLocal> {
  @override
  final int typeId = 3;

  @override
  GeoEntityLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GeoEntityLocal(
      lat: fields[0] as String,
      lng: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GeoEntityLocal obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lat)
      ..writeByte(1)
      ..write(obj.lng);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeoEntityLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
