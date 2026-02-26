import '../entities/grocery_product.dart';
import '../repositories/grocery_repository.dart';

class GetAllProducts {
  final GroceryRepository repository;

  GetAllProducts(this.repository);

  Future<List<GroceryProduct>> call() => repository.getAllProducts();
}
