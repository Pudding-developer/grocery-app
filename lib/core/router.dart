import 'package:go_router/go_router.dart';

import 'package:groceryapp/domain/entities/grocery_product.dart';
import 'package:groceryapp/presentation/screens/home/home_screen.dart';
import 'package:groceryapp/presentation/screens/products/products_list_screen.dart';
import 'package:groceryapp/presentation/screens/products/product_detail_screen.dart';
import 'package:groceryapp/presentation/screens/products/add_edit_product_screen.dart';

/// Centralised GoRouter configuration for the app.
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/products',
        builder: (context, state) => const ProductsListScreen(),
      ),
      GoRoute(
        path: '/product-detail',
        builder: (context, state) {
          final product = state.extra! as GroceryProduct;
          return ProductDetailScreen(product: product);
        },
      ),
      GoRoute(
        path: '/add-product',
        builder: (context, state) => const AddEditProductScreen(),
      ),
      GoRoute(
        path: '/edit-product',
        builder: (context, state) {
          final product = state.extra! as GroceryProduct;
          return AddEditProductScreen(product: product);
        },
      ),
    ],
  );
}
