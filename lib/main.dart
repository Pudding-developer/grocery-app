import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/service/service_locator.dart';
import 'core/router.dart';
import 'data/datasources/grocery_local_datasource.dart';
import 'data/models/grocery_product_model.dart';
import 'presentation/bloc/grocery_bloc.dart';
import 'presentation/bloc/grocery_event.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(GroceryProductModelAdapter());
  await Hive.openBox<GroceryProductModel>(GroceryLocalDatasourceImpl.boxName);

  await _seedInitialData();
  await setupServiceLocator();

  runApp(const GroceryApp());
}

Future<void> _seedInitialData() async {
  final box =
      Hive.box<GroceryProductModel>(GroceryLocalDatasourceImpl.boxName);
  if (box.isNotEmpty) return;

  final seeds = [
    GroceryProductModel(
      id: '1',
      name: 'Organic Avocado',
      category: 'Fruits',
      price: 142.00,
      unit: 'kilo',
      description:
          'Freshly harvested organic avocados, rich in healthy fats and nutrients.',
      isOrganic: true,
      stockQuantity: 120,
    ),
    GroceryProductModel(
      id: '2',
      name: 'Whole Wheat Bread',
      category: 'Bakery',
      price: 68.00,
      unit: 'loaf',
      description:
          'Wholesome whole wheat bread, ideal for sandwiches and everyday meals.',
      isOrganic: false,
      stockQuantity: 45,
    ),
    GroceryProductModel(
      id: '3',
      name: 'Eggs',
      category: 'Dairy',
      price: 120.00,
      unit: 'dozen',
      description:
          'Farm-fresh organic eggs, a versatile and protein-rich kitchen staple.',
      isOrganic: true,
      stockQuantity: 80,
    ),
    GroceryProductModel(
      id: '4',
      name: 'Almond Milk',
      category: 'Dairy',
      price: 150.00,
      unit: 'litre',
      description:
          'Smooth and creamy almond milk, a nutritious dairy-free alternative.',
      isOrganic: false,
      stockQuantity: 60,
    ),
    GroceryProductModel(
      id: '5',
      name: 'Sitaw',
      category: 'Vegetables',
      price: 35.00,
      unit: 'bunch',
      description:
          'Freshly picked organic string beans, suitable for a variety of Filipino dishes including sinigang, adobo, and ginisa.',
      isOrganic: true,
      stockQuantity: 95,
    ),
    GroceryProductModel(
      id: '6',
      name: 'Chicken',
      category: 'Meat',
      price: 210.00,
      unit: 'kg',
      description:
          'Premium quality chicken, an excellent source of lean protein for balanced meals.',
      isOrganic: false,
      stockQuantity: 35,
    ),
    GroceryProductModel(
      id: '7',
      name: 'Yakult',
      category: 'Dairy',
      price: 10.00,
      unit: 'piece',
      description:
          'A probiotic fermented milk drink that supports digestive health and gut wellness.',
      isOrganic: false,
      stockQuantity: 110,
    ),
    GroceryProductModel(
      id: '8',
      name: 'Organic Blueberries',
      category: 'Fruits',
      price: 285.00,
      unit: 'pack',
      description:
          'Plump and flavorful organic blueberries, packed with antioxidants and essential vitamins.',
      isOrganic: true,
      stockQuantity: 70,
    ),
  ];

  for (final item in seeds) {
    await box.put(item.id, item);
  }
}

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<GroceryBloc>()..add(const LoadProducts()),
      child: MaterialApp.router(
        title: 'Grocery App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
