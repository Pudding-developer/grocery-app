import '../entities/grocery_product.dart';
import '../repositories/grocery_repository.dart';

class UpdateProduct {
  final GroceryRepository repository;

  UpdateProduct(this.repository);

  Future<void> call(GroceryProduct product) => repository.updateProduct(product);
}
