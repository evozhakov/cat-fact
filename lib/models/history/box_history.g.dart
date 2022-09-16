// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'box_history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavedHistoryAdapter extends TypeAdapter<SavedHistory> {
  @override
  final int typeId = 1;

  @override
  SavedHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SavedHistory(
      date: fields[0] as String,
      fact: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SavedHistory obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.fact);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavedHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
