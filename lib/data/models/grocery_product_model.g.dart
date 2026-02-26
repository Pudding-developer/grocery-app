// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroceryProductModelAdapter extends TypeAdapter<GroceryProductModel> {
  @override
  final int typeId = 0;

  @override
  GroceryProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GroceryProductModel(
      id: fields[0] as String,
      name: fields[1] as String,
      category: fields[2] as String,
      price: fields[3] as double,
      unit: fields[4] as String,
      description: fields[5] as String,
      isOrganic: fields[6] as bool,
      stockQuantity: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, GroceryProductModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.unit)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.isOrganic)
      ..writeByte(7)
      ..write(obj.stockQuantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroceryProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
