import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:groceryapp/domain/entities/grocery_product.dart';
import 'package:groceryapp/presentation/bloc/grocery_bloc.dart';
import 'package:groceryapp/presentation/bloc/grocery_event.dart';

/// Detail view for a single grocery product.
///
/// Receives its data through the constructor. Edit and delete actions
/// are dispatched to [GroceryBloc].
class ProductDetailScreen extends StatelessWidget {
  final GroceryProduct product;

  const ProductDetailScreen({super.key, required this.product});

  static IconData _iconForCategory(String category) {
    switch (category) {
      case 'Fruits':
        return Icons.apple;
      case 'Vegetables':
        return Icons.grass;
      case 'Dairy':
        return Icons.egg;
      case 'Bakery':
        return Icons.breakfast_dining;
      case 'Meat':
        return Icons.set_meal;
      case 'Beverages':
        return Icons.local_drink;
      case 'Snacks':
        return Icons.cookie;
      default:
        return Icons.shopping_basket;
    }
  }

  void _confirmDelete(BuildContext context) {
    final bloc = context.read<GroceryBloc>();
    final router = GoRouter.of(context);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Product'),
        content: Text('Remove "${product.name}" from your list?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              bloc.add(DeleteProductEvent(product.id));
              router.go('/products');
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            tooltip: 'Delete',
            onPressed: () => _confirmDelete(context),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/edit-product', extra: product),
        child: const Icon(Icons.edit),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header icon
            Center(
              child: CircleAvatar(
                radius: 48,
                backgroundColor: product.isOrganic
                    ? Colors.green.shade100
                    : theme.colorScheme.primaryContainer,
                child: Icon(
                  _iconForCategory(product.category),
                  size: 48,
                  color: product.isOrganic
                      ? Colors.green.shade700
                      : theme.colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                product.name,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Chip(
                label: Text(product.category),
                avatar: const Icon(Icons.label_outline, size: 18),
              ),
            ),
            const SizedBox(height: 24),

            // Description
            Text(
              'Description',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.description,
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),

            // Details table
            _DetailRow(
                label: 'Price',
                value: '₱${product.price.toStringAsFixed(2)} / ${product.unit}'),
            _DetailRow(label: 'Unit', value: product.unit),
            _DetailRow(
                label: 'Organic', value: product.isOrganic ? 'Yes ✅' : 'No'),
            _DetailRow(
                label: 'In Stock', value: '${product.stockQuantity} units'),
            _DetailRow(label: 'ID', value: product.id),
          ],
        ),
      ),
    );
  }
}

/// Simple label-value row for the detail view.
class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
