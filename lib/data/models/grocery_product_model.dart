import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entities/grocery_product.dart';

part 'grocery_product_model.g.dart';

@HiveType(typeId: 0)
class GroceryProductModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String category;

  @HiveField(3)
  final double price;

  @HiveField(4)
  final String unit;

  @HiveField(5)
  final String description;

  @HiveField(6)
  final bool isOrganic;

  @HiveField(7)
  final int stockQuantity;

  GroceryProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.unit,
    required this.description,
    required this.isOrganic,
    required this.stockQuantity,
  });

  factory GroceryProductModel.fromEntity(GroceryProduct entity) {
    return GroceryProductModel(
      id: entity.id,
      name: entity.name,
      category: entity.category,
      price: entity.price,
      unit: entity.unit,
      description: entity.description,
      isOrganic: entity.isOrganic,
      stockQuantity: entity.stockQuantity,
    );
  }

  GroceryProduct toEntity() {
    return GroceryProduct(
      id: id,
      name: name,
      category: category,
      price: price,
      unit: unit,
      description: description,
      isOrganic: isOrganic,
      stockQuantity: stockQuantity,
    );
  }
}
