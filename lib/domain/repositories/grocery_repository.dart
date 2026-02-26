import '../entities/grocery_product.dart';

abstract class GroceryRepository {
  Future<List<GroceryProduct>> getAllProducts();
  Future<void> addProduct(GroceryProduct product);
  Future<void> updateProduct(GroceryProduct product);
  Future<void> deleteProduct(String id);
}
