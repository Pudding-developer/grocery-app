import 'package:get_it/get_it.dart';

import '../../data/datasources/grocery_local_datasource.dart';
import '../../data/repositories/grocery_repository_impl.dart';
import '../../domain/repositories/grocery_repository.dart';
import '../../domain/usecases/get_all_products.dart';
import '../../domain/usecases/add_product.dart';
import '../../domain/usecases/update_product.dart';
import '../../domain/usecases/delete_product.dart';
import '../../presentation/bloc/grocery_bloc.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Datasources
  sl.registerLazySingleton<GroceryLocalDatasource>(
    () => GroceryLocalDatasourceImpl(),
  );

  // Repositories
  sl.registerLazySingleton<GroceryRepository>(
    () => GroceryRepositoryImpl(datasource: sl()),
  );

  // Use Cases
  sl.registerLazySingleton(() => GetAllProducts(sl()));
  sl.registerLazySingleton(() => AddProduct(sl()));
  sl.registerLazySingleton(() => UpdateProduct(sl()));
  sl.registerLazySingleton(() => DeleteProduct(sl()));

  // BLoC — factory so each call creates a fresh instance
  sl.registerFactory(
    () => GroceryBloc(
      getAllProducts: sl(),
      addProduct: sl(),
      updateProduct: sl(),
      deleteProduct: sl(),
    ),
  );
}
