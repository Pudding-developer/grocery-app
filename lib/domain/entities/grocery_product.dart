import 'package:equatable/equatable.dart';

/// Domain entity representing a grocery product.
class GroceryProduct extends Equatable {
  final String id;
  final String name;
  final String category;
  final double price;
  final String unit;
  final String description;
  final bool isOrganic;
  final int stockQuantity;

  const GroceryProduct({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.unit,
    required this.description,
    required this.isOrganic,
    required this.stockQuantity,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        price,
        unit,
        description,
        isOrganic,
        stockQuantity,
      ];
}
