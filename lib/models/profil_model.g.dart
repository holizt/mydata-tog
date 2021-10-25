// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profil_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfilModelAdapter extends TypeAdapter<ProfilModel> {
  @override
  final int typeId = 1;

  @override
  ProfilModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfilModel(
      name: fields[0] as String,
      address: fields[1] as String,
      date: fields[2] as DateTime,
      height: fields[3] as double,
      weight: fields[4] as double,
      imgPath: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProfilModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.height)
      ..writeByte(4)
      ..write(obj.weight)
      ..writeByte(5)
      ..write(obj.imgPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfilModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
