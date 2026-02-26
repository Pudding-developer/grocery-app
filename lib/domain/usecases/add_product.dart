import '../entities/grocery_product.dart';
import '../repositories/grocery_repository.dart';

class AddProduct {
  final GroceryRepository repository;

  AddProduct(this.repository);

  Future<void> call(GroceryProduct product) => repository.addProduct(product);
}
