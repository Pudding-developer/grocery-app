import 'package:hive_flutter/hive_flutter.dart';

import '../models/grocery_product_model.dart';

abstract class GroceryLocalDatasource {
  Future<List<GroceryProductModel>> getAllProducts();
  Future<void> addProduct(GroceryProductModel model);
  Future<void> updateProduct(GroceryProductModel model);
  Future<void> deleteProduct(String id);
}

class GroceryLocalDatasourceImpl implements GroceryLocalDatasource {
  static const String boxName = 'products';

  Box<GroceryProductModel> get _box =>
      Hive.box<GroceryProductModel>(boxName);

  @override
  Future<List<GroceryProductModel>> getAllProducts() async {
    return _box.values.toList();
  }

  @override
  Future<void> addProduct(GroceryProductModel model) async {
    await _box.put(model.id, model);
  }

  @override
  Future<void> updateProduct(GroceryProductModel model) async {
    await _box.put(model.id, model);
  }

  @override
  Future<void> deleteProduct(String id) async {
    await _box.delete(id);
  }
}
