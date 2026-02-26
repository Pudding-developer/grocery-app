import 'package:equatable/equatable.dart';

import '../../domain/entities/grocery_product.dart';

abstract class GroceryState extends Equatable {
  const GroceryState();

  @override
  List<Object?> get props => [];
}

class GroceryInitial extends GroceryState {}

class GroceryLoading extends GroceryState {}

class GroceryLoaded extends GroceryState {
  final List<GroceryProduct> products;

  const GroceryLoaded(this.products);

  @override
  List<Object?> get props => [products];
}

class GroceryError extends GroceryState {
  final String message;

  const GroceryError(this.message);

  @override
  List<Object?> get props => [message];
}
