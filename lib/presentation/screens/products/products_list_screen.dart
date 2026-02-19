import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:groceryapp/domain/entities/grocery_product.dart';
import 'package:groceryapp/presentation/components/product_card.dart';

/// Scrollable list of hardcoded grocery products.
class ProductsListScreen extends StatelessWidget {
  const ProductsListScreen({super.key});

  static const List<GroceryProduct> _products = [
  GroceryProduct(
    id: '1',
    name: 'Organic Avocado',
    category: 'Fruits',
    price: 142.00,
    unit: 'kilo',
    description: 'Freshly harvested organic avocados, rich in healthy fats and nutrients.',
    isOrganic: true,
    stockQuantity: 120,
  ),
  GroceryProduct(
    id: '2',
    name: 'Whole Wheat Bread',
    category: 'Bakery',
    price: 68.00,
    unit: 'loaf',
    description: 'Wholesome whole wheat bread, ideal for sandwiches and everyday meals.',
    isOrganic: false,
    stockQuantity: 45,
  ),
  GroceryProduct(
    id: '3',
    name: 'Eggs',
    category: 'Dairy',
    price: 120.00,
    unit: 'dozen',
    description: 'Farm-fresh organic eggs, a versatile and protein-rich kitchen staple.',
    isOrganic: true,
    stockQuantity: 80,
  ),
  GroceryProduct(
    id: '4',
    name: 'Almond Milk',
    category: 'Dairy',
    price: 150.00,
    unit: 'litre',
    description: 'Smooth and creamy almond milk, a nutritious dairy-free alternative.',
    isOrganic: false,
    stockQuantity: 60,
  ),
  GroceryProduct(
    id: '5',
    name: 'Sitaw',
    category: 'Vegetables',
    price: 35.00,
    unit: 'bunch',
    description: 'Freshly picked organic string beans, suitable for a variety of Filipino dishes including sinigang, adobo, and ginisa.',
    isOrganic: true,
    stockQuantity: 95,
  ),
  GroceryProduct(
    id: '6',
    name: 'Chicken',
    category: 'Meat',
    price: 210.00,
    unit: 'kg',
    description: 'Premium quality chicken, an excellent source of lean protein for balanced meals.',
    isOrganic: false,
    stockQuantity: 35,
  ),
  GroceryProduct(
    id: '7',
    name: 'Yakult',
    category: 'Dairy',
    price: 10.00,
    unit: 'piece',
    description: 'A probiotic fermented milk drink that supports digestive health and gut wellness.',
    isOrganic: false,
    stockQuantity: 110,
  ),
  GroceryProduct(
    id: '8',
    name: 'Organic Blueberries',
    category: 'Fruits',
    price: 285.00,
    unit: 'pack',
    description: 'Plump and flavorful organic blueberries, packed with antioxidants and essential vitamins.',
    isOrganic: true,
    stockQuantity: 70,
  ),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return ProductCard(
            product: product,
            onTap: () => context.push('/product-detail', extra: product),
          );
        },
      ),
    );
  }
}
