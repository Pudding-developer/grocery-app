import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_all_products.dart';
import '../../domain/usecases/add_product.dart';
import '../../domain/usecases/update_product.dart';
import '../../domain/usecases/delete_product.dart';
import 'grocery_event.dart';
import 'grocery_state.dart';

class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  final GetAllProducts getAllProducts;
  final AddProduct addProduct;
  final UpdateProduct updateProduct;
  final DeleteProduct deleteProduct;

  GroceryBloc({
    required this.getAllProducts,
    required this.addProduct,
    required this.updateProduct,
    required this.deleteProduct,
  }) : super(GroceryInitial()) {
    on<LoadProducts>(_onLoadProducts);
    on<AddProductEvent>(_onAddProduct);
    on<UpdateProductEvent>(_onUpdateProduct);
    on<DeleteProductEvent>(_onDeleteProduct);
  }

  Future<void> _onLoadProducts(
    LoadProducts event,
    Emitter<GroceryState> emit,
  ) async {
    emit(GroceryLoading());
    try {
      final products = await getAllProducts();
      emit(GroceryLoaded(products));
    } catch (e) {
      emit(GroceryError(e.toString()));
    }
  }

  Future<void> _onAddProduct(
    AddProductEvent event,
    Emitter<GroceryState> emit,
  ) async {
    try {
      await addProduct(event.product);
      final products = await getAllProducts();
      emit(GroceryLoaded(products));
    } catch (e) {
      emit(GroceryError(e.toString()));
    }
  }

  Future<void> _onUpdateProduct(
    UpdateProductEvent event,
    Emitter<GroceryState> emit,
  ) async {
    try {
      await updateProduct(event.product);
      final products = await getAllProducts();
      emit(GroceryLoaded(products));
    } catch (e) {
      emit(GroceryError(e.toString()));
    }
  }

  Future<void> _onDeleteProduct(
    DeleteProductEvent event,
    Emitter<GroceryState> emit,
  ) async {
    try {
      await deleteProduct(event.id);
      final products = await getAllProducts();
      emit(GroceryLoaded(products));
    } catch (e) {
      emit(GroceryError(e.toString()));
    }
  }
}
