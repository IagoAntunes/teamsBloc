// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_class_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ListClassModelAdapter extends TypeAdapter<ListClassModel> {
  @override
  final int typeId = 3;

  @override
  ListClassModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListClassModel(
      listClassModel: (fields[0] as List).cast<ClassModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, ListClassModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.listClassModel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListClassModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
