import '../repositories/grocery_repository.dart';

class DeleteProduct {
  final GroceryRepository repository;

  DeleteProduct(this.repository);

  Future<void> call(String id) => repository.deleteProduct(id);
}
