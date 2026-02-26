import 'package:equatable/equatable.dart';

import '../../domain/entities/grocery_product.dart';

abstract class GroceryEvent extends Equatable {
  const GroceryEvent();

  @override
  List<Object?> get props => [];
}

class LoadProducts extends GroceryEvent {
  const LoadProducts();
}

class AddProductEvent extends GroceryEvent {
  final GroceryProduct product;

  const AddProductEvent(this.product);

  @override
  List<Object?> get props => [product];
}

class UpdateProductEvent extends GroceryEvent {
  final GroceryProduct product;

  const UpdateProductEvent(this.product);

  @override
  List<Object?> get props => [product];
}

class DeleteProductEvent extends GroceryEvent {
  final String id;

  const DeleteProductEvent(this.id);

  @override
  List<Object?> get props => [id];
}
