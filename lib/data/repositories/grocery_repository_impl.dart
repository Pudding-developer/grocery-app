import '../../domain/entities/grocery_product.dart';
import '../../domain/repositories/grocery_repository.dart';
import '../datasources/grocery_local_datasource.dart';
import '../models/grocery_product_model.dart';

class GroceryRepositoryImpl implements GroceryRepository {
  final GroceryLocalDatasource datasource;

  GroceryRepositoryImpl({required this.datasource});

  @override
  Future<List<GroceryProduct>> getAllProducts() async {
    final models = await datasource.getAllProducts();
    final products = models.map((m) => m.toEntity()).toList();
    // Sort by numeric ID so seeded products (1-8) stay on top
    // and newly added products (timestamp IDs) appear at the bottom.
    products.sort((a, b) {
      final aId = int.tryParse(a.id) ?? 0;
      final bId = int.tryParse(b.id) ?? 0;
      return aId.compareTo(bId);
    });
    return products;
  }

  @override
  Future<void> addProduct(GroceryProduct product) async {
    await datasource.addProduct(GroceryProductModel.fromEntity(product));
  }

  @override
  Future<void> updateProduct(GroceryProduct product) async {
    await datasource.updateProduct(GroceryProductModel.fromEntity(product));
  }

  @override
  Future<void> deleteProduct(String id) async {
    await datasource.deleteProduct(id);
  }
}
